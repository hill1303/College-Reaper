# The SchedulesController handles requests for generating a new schedule, as well as displaying the results thereof and
# any currently selected schedule of the current user.
# noinspection RubyStringKeysInHashInspection
class SchedulesController < ApplicationController
  include Wicked::Wizard

  steps :course_load, :courses, :times, :locations, :generate_schedules

# Routes to the home page for SchedulesController
  def index

  end

  # Shows a schedule
  def show
    @tips = ('<p>' << tips[step].join('</p><p>') << '</p>').html_safe if tips[step]

    case step
      when :course_load
        user_session['new_prefs'] = Hash.new
        @preference = Preference.new
      when :courses
        unless user_session['new_prefs']['force_courses'] == '1'
          skip_step
        end
      when :generate_schedules
        preference = Preference.where(user_id: current_user.id).last
        section_set = Section.all.to_set
        schedules = GenScheduleHelper::ScheduleGenerator.evolve_schedules preference, section_set
        # Save the schedules to the database
        schedules.each do |schedule|
          section_ids = [] 
          schedule.class_section_set.each { |class_section| section_ids.push class_section.id }         
          sections_sql = 'id IN ('
          section_ids.size.times do |x| 
            if x == (section_ids.size - 1)
              sections_sql += '?)'
            else
              sections_sql += '?, '
            end
          end
          section_ids.shift sections_sql
          Schedule.create ({
            preference: schedule.preference,
            score: schedule.aggregate_score,
            user: schedule.preferences.user,
            sections: Sections.where(section_ids),
            sub_scores: {
              time_sub_score: schedule.time_sub_score,
              distance_sub_score: schedule.distance_sub_score,
              ge_major_sub_score: schedule.ge_major_sub_score,
              credit_hour_sub_score: schedule.credit_hour_sub_score
            }
          })
        end
      else
    end
    @preference = Preference.new choices: user_session['new_prefs'], user: current_user
    render_wizard
  end

  # Updates the score of a schedule taking into account, the user preferences
  def update
    user_session['new_prefs'] ||= Hash.new

    case step
      when :course_load
        # Bias the major/ge lean slider and interpret the results
        bias_param 'ge_major_lean', 'ge', 'major'

        # Bias the credit lean slider and interpret the results
        bias_param 'credit_lean', 'low', 'high'

        user_session['new_prefs'].merge! params['preference']
      when :courses
        # Flatten the :choices effect from fields_for here so it merges correctly
        params['preference']['choices'].each_key do |key|
          if key[0,6] == 'course' and not params['preference']['choices'][key.to_s].empty?
            id = view_context.autocompleted_course_to_id params['preference']['choices'][key.to_s]
            if id.nil?
              params['preference']['choices'][key] = ''
            else
              params['preference']['choices'][key] = id.to_s
            end
          end
        end
        user_session['new_prefs'].merge! params['preference']['choices']
      when :times
        day_remap = {
            'Sunday' => 'U',
            'Monday' => 'M',
            'Tuesday' => 'T',
            'Wednesday' => 'W',
            'Thursday' => 'R',
            'Friday' => 'F',
            'Saturday' => 'S'
        }

        # Invert choices to build the exclusion string
        attendance_string = String.new
        Date::DAYNAMES.each do |day|
          if params['preference']['choices'][day] == '0'
            attendance_string << day_remap[day]
          end
        end
        params['preference'].delete('choices')
        params['preference']['exclude_day_pattern'] = attendance_string

        user_session['new_prefs'].merge! params['preference']

      when :locations
        user_session['new_prefs'].merge! params['preference']

        # Begin cleanup of times
        user_session['new_prefs']['start_time'] = DateTime.new(user_session['new_prefs']['start_time(1i)'].to_i,
                                                               user_session['new_prefs']['start_time(2i)'].to_i,
                                                               user_session['new_prefs']['start_time(3i)'].to_i,
                                                               user_session['new_prefs']['start_time(4i)'].to_i,
                                                               user_session['new_prefs']['start_time(5i)'].to_i)
        user_session['new_prefs'].delete_if do |key, value|
          key =~ /start_time\(\di\)/
        end

        user_session['new_prefs']['end_time'] = DateTime.new(user_session['new_prefs']['end_time(1i)'].to_i,
                                                             user_session['new_prefs']['end_time(2i)'].to_i,
                                                             user_session['new_prefs']['end_time(3i)'].to_i,
                                                             user_session['new_prefs']['end_time(4i)'].to_i,
                                                             user_session['new_prefs']['end_time(5i)'].to_i)
        user_session['new_prefs'].delete_if do |key, value|
          key =~ /end_time\(\di\)/
        end

        # Clean out extra key
        user_session['new_prefs'].delete('force_courses')

        pref = Preference.create choices: user_session['new_prefs'], user: current_user
      else
        user_session['new_prefs'].merge! params['preference']
    end

    # Strip empty values in hash
    user_session['new_prefs'].delete_if do |key, value|
      value == ''
    end

    redirect_to next_wizard_path
  end

  # The +tips+ method simply displays text to a user to remind them that having less restrictions will allow the
  # application to find more optimal schedules for them.

  protected
  def tips
    {
      courses: [
          'Leaving more blank fields will result in more possible schedules.',
          'Having more possible schedules means we can find the best fit for you more easily.',
          'If you include a lot of courses here, you will also raise the odds that no valid schedule will exist.'
      ]
    }
  end

  def bias_param(parameter, low, high)
    bias_hash = view_context.bias_slider params['preference'][parameter + '_weight']
    if bias_hash[:bias] == 0
      params['preference'][parameter] = low
      params['preference'][parameter + '_weight'] = bias_hash[:strength].to_s
    elsif bias_hash[:bias] == 1
      params['preference'][parameter] = high
      params['preference'][parameter + '_weight'] = bias_hash[:strength].to_s
    else
      params['preference'][parameter] = 'none'
    end
  end
end