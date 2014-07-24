require 'rails_helper'

describe Term do
  it 'has a valid factory' do
    expect(build(:term)).to be_valid
  end

  it 'has and belongs to many :courses' do
    should have_and_belong_to_many :courses
  end

  it 'has one :preference' do
    should have_one :preference
  end

  it 'has many :schedules' do
    should have_many :schedules
  end

  context 'attributes' do
    let :term do
      build :term
    end

    it 'has a :name attribute' do
      expect(term.attributes).to include('name')
    end

    it 'has a :start_date attribute' do
      expect(term.attributes).to include('start_date')
    end

    it 'has a :end_date attribute' do
      expect(term.attributes).to include('end_date')
    end
  end 
  
  context 'validates' do
    it 'the presence of the :name attribute' do
      should validate_presence_of :name
    end

    it 'the presence of the :start_date attribute' do
      should validate_presence_of :start_date
    end

    it 'the presence of the :end_date attribute' do
      should validate_presence_of :end_date
    end
  end
end
