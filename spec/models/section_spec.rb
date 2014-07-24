require 'rails_helper'

describe Section do
  it 'has a valid factory' do
    expect(build(:section)).to be_valid
  end

  it 'belongs to a :person' do
    should belong_to :person
  end

  it 'belongs to a :course' do
    should belong_to :course
  end

  it 'belongs to a :location' do
    should belong_to :location
  end

  it 'belongs to a :term' do
    should belong_to :term
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
  
  context 'validates' do
    it 'the presence of the :room attribute' do
      should validate_presence_of :room
    end

    it 'the presence of the :start_time attribute' do
      should validate_presence_of :start_time
    end

    it 'the presence of the :end_time attribute' do
      should validate_presence_of :end_time
    end

    it 'the presence of the :rpt_pattern attribute' do
      should validate_presence_of :rpt_pattern
    end

    it 'the presence of the :course_seats attribute' do
      should validate_presence_of :course_seats
    end

    it 'the presence of the :wait_seats attribute' do
      should validate_presence_of :wait_seats
    end

    it 'the presence of the :seat_max attribute' do
      should validate_presence_of :seat_max
    end

    it 'the presence of the :wait_max attribute' do
      should validate_presence_of :wait_max
    end

    it 'numericality of the :course_seats 'do
      should validate_numericality_of(:course_seats)
    end
    
    it 'numericality of the :wait_seats 'do
      should validate_numericality_of(:wait_seats)
    end

     it 'numericality of the :seat_max 'do
      should validate_numericality_of(:seat_max)
    end
    
    it 'numericality of the :wait_max 'do
      should validate_numericality_of(:wait_max)
    end
  end
end
