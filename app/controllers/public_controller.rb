#
#
class PublicController < ApplicationController
  # Don't require login from the user for any of these
  skip_before_action :authenticate_user!
  
  #
  def home 
  end
end