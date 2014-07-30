require 'rails_helper'

describe 'home page' do
  it 'displays the home page' do
    get '/'
    expect(response.body).to include('Get in touch!')
  end
end