# The SchedulesController handles requests for generating a new schedule, as well as displaying the results thereof and
# any currently selected schedule of the current user.
class SchedulesController < ApplicationController
  include Wicked::Wizard

  steps :courses, :times, :locations

  def index

  end

  def show
    @preference = Preference.new
    render_wizard
  end
end