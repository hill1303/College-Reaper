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
end
