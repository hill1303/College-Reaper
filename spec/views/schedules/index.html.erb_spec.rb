require 'rails_helper'

describe '/course_load' do
  it 'Displays correct prompt text' do
    render
    expect(rendered).to include('Start your schedule!')
    expect(rendered).to include('Your Schedule')
  end
end