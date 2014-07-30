# The PublicController handles the information about the Webpage. It handles info about Home,
# About page, Terms of Service, privacy and Contact us  
class PublicController < ApplicationController
  # Don't require login from the user for any of these
  skip_before_action :authenticate_user!
  
  # Routes to the home page of the Website
  def home 
    
  end

  # Routes to the about page of the Website
  def about

  end

  # Routes to the terms page of the Website
  def terms

  end

  # Routes to the privacy page of the Website
  def privacy

  end

  # Routes to the contact page of the Website
  def contact

  end
end