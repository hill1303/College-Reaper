# The ApplicationController is the superclass for all controllers in the application and can be used to apply certain
# requirements or provide certain functionality to all actions in the application. Obviously, things here should be done
# sparingly and judiciously, with clear documentation provided which both describes the functionality and justifies its
# placement here instead of in a lower level controller.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Add require authentication for all controllers and actions unless explicitly exempted.
  before_action :authenticate_user!

  # Modifies the set of permitted parameters to certain Devise actions, if we're about to call a Devise controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # Add parameters to the list of allowed params on the appropriate Devise controllers in order to facilitate them
  # accepting nested attributes for Person and such. All of the params in the array `params` are added to each of the
  # actions in `actions` automatically when a Devise controller is being called (as per the before_action call above).
  def configure_permitted_parameters
    actions = [:sign_up, :account_update]
    params = [:name, :title, :suffix, :dob, :sex, :gender, :pronoun, :uuid]

    actions.each do |action|
      params.each do |param|
        devise_parameter_sanitizer.for(action) << param
      end
    end
  end
end
