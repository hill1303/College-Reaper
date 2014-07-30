# The SchedulesController handles requests for generating a new schedule, as well as displaying the results thereof and
# any currently selected schedule of the current user.
class SchedulesController < ApplicationController
  include Wicked::Wizard

  steps :course_load, :courses, :times, :locations, :generate_schedules

  def index

  end

  def show
    @tips = ('<li>' << tips[step].join('</li><li>') << '</li>').html_safe if tips[step]

    case step
      when :course_load
        @preference = Preference.new
      else
    end
    @preference = Preference.new choices: user_session['new_prefs'], user: current_user
    render_wizard
  end

  def update
    user_session[:new_prefs] ||= Hash.new

    case step
      when :generate_schedules
        Preference.create user_session[:new_prefs]
      else
        user_session[:new_prefs].merge! params['preference']
    end
    redirect_to next_wizard_path
  end

  protected
  def tips
    {
      course_load: [
          'No!',
          'You will regret it'
      ],
      courses: [
          'please stop'
      ]
    }
  end
end