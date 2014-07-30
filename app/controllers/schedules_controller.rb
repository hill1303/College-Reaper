# The SchedulesController handles requests for generating a new schedule, as well as displaying the results thereof and
# any currently selected schedule of the current user.
# noinspection RubyStringKeysInHashInspection
class SchedulesController < ApplicationController
  include Wicked::Wizard

  steps :course_load, :courses, :times, :locations, :generate_schedules

  DAY_REMAP = {
                'Sunday' => 'U',
                'Monday' => 'M',
                'Tuesday' => 'T',
                'Wednesday' => 'W',
                'Thursday' => 'R',
                'Friday' => 'F',
                'Saturday' => 'S'
              }

  # Routes to the home page for SchedulesController
  def index
    @schedule = Schedule.where(user_id: current_user.id).last
  end

  #Sets preferences for a user and displays the appropriate view
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
        run_schedules
      else
    end
    @preference = Preference.new choices: user_session['new_prefs'], user: current_user
    render_wizard
  end

  # Updates the score of the algorithm if a user chooses to change their preferences
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
        flatten_courses
        user_session['new_prefs'].merge! params['preference']['choices']
      when :times
        flatten_exclusions
        user_session['new_prefs'].merge! params['preference']
      when :locations
        user_session['new_prefs'].merge! params['preference']

        # Do cleanup of times
        convert_and_clean_up_dates 'start_time'
        convert_and_clean_up_dates 'end_time'

        # Clean out extra key for force_courses
        user_session['new_prefs'].delete('force_courses')

        # Save to the database
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


  protected
  # The +tips+ method simply displays text to a user to remind them that having less restrictions will allow the
  # application to find more optimal schedules for them.
  def tips
    {
      courses: [
          'Leaving more blank fields will result in more possible schedules.',
          'Having more possible schedules means we can find the best fit for you more easily.',
          'If you include a lot of courses here, you will also raise the odds that no valid schedule will exist.'
      ]
    }
  end

  # Adds the bias to the preferences
  def bias_param(parameter, low, high)
    bias_hash = view_context.bias_slider params['preference'][parameter + '_weight']
    if bias_hash[:bias].nil?
      params['preference'][parameter] = 'none'
    else
      params['preference'][parameter] = bias_hash[:bias] == 0 ? low : high
      params['preference'][parameter + '_weight'] = bias_hash[:strength].to_s
    end
  end

  # Converts dates into formats that can be used by the database
  def convert_and_clean_up_dates parameter
    user_session['new_prefs'][parameter] = Time.parse(user_session['new_prefs'][parameter + '(4i)'] + ':' +
                                                      user_session['new_prefs'][parameter + '(5i)'])
    user_session['new_prefs'].delete_if do |key, value|
      key =~ /#{parameter}\(\di\)/
    end
  end

  # Runs the schedules
  def run_schedules
    preference = Preference.where(user_id: current_user.id).last
    section_set = Section.all.to_set
    schedules = GenScheduleHelper::ScheduleGenerator.evolve_schedules preference, section_set
    schedules = schedules.to_a.sort do |x,y|
      x.aggregate_score <=> y.aggregate_score
    end

    # Save the schedules to the database
    schedules.each do |schedule|
      section_ids = []
      schedule.class_section_set.each { |class_section| section_ids.push class_section.id }
      sections_sql = ['id IN (']
      section_ids.size.times do |x|
        if x == (section_ids.size - 1)
          sections_sql[0] += '?)'
        else
          sections_sql[0] += '?, '
        end
      end

      section_ids.each do |id|
        sections_sql.push id.to_s
      end

      Schedule.create ({
          preference: schedule.preferences,
          score: schedule.aggregate_score,
          user: schedule.preferences.user,
          sections: Section.where(sections_sql),
          sub_scores: {
              time_sub_score: schedule.time_sub_score,
              distance_sub_score: schedule.distance_sub_score,
              ge_major_sub_score: schedule.ge_major_sub_score,
              credit_hour_sub_score: schedule.credit_hour_sub_score
          }
      })
    end
  end

  # Formats courses
  def flatten_courses
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
  end

  # Formats Exclusions
  def flatten_exclusions
    # Invert choices to build the exclusion string
    attendance_string = String.new
    Date::DAYNAMES.each do |day|
      if params['preference']['choices'][day] == '0'
        attendance_string << DAY_REMAP[day]
      end
    end
    params['preference'].delete('choices')
    params['preference']['exclude_day_pattern'] = attendance_string
  end
end