
# The PublicController handles the information about the Webpage. It handles info about Home, 
# About page, Terms of Service, privacy and Contact us  

class PublicController < ApplicationController
  # Don't require login from the user for any of these
  skip_before_action :authenticate_user!
  
  # Routes to the home page for PublicController
  def home 
    
  end

  def about
  end
  def terms
  end
  def privacy
  end
  def contact
  end
end