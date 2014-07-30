require 'rails_helper'

describe 'schedules/course_load' do
  it 'Displays correct prompt text' do
    render
    expect(rendered).to include('How many classes would you like to take this semester (total)?')
    expect(rendered).to include ('I need to specify certain course numbers that I <strong>must</strong> take')
    end
end