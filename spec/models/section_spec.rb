require 'rails_helper'

describe Section do
  it 'has a valid factory' do
    expect(build(:section)).to be_valid
  end

  context 'attributes' do
    let :section do
      build :section
    end

    it 'includes a :room attribute' do
      expect(section.attributes).to include('room')
    end

    it 'includes a :start_time attribute' do
      expect(section.attributes).to include('start_time')
    end

    it 'includes a :end_time attribute' do
      expect(section.attributes).to include('end_time')
    end

    it 'includes a :rpt_pattern attribute' do
      expect(section.attributes).to include('rpt_pattern')
    end

    it 'includes a :open attribute' do
      expect(section.attributes).to include('open')
    end

    it 'includes a :course_seats attribute' do
      expect(section.attributes).to include('course_seats')
    end

    it 'includes a :wait_seats attribute' do
      expect(section.attributes).to include('wait_seats')
    end

    it 'includes a :seat_max attribute' do
      expect(section.attributes).to include('seat_max')
    end

    it 'includes a :wait_max attribute' do
      expect(section.attributes).to include('wait_max')
    end
  end
end