require 'rails_helper'

describe 'public/home'  do
  it "displays the content" do
    render
      expect(rendered).to include('This is the Home page.')
    end
end