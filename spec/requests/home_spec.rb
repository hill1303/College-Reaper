require 'rails_helper'

describe "home page" do
  it "displays the home page" do 
    get '/'
    expect(response.body).to include('This is the Home page.')
  end
end