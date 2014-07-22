require 'rails_helper'

describe Term do
  it 'has a valid factory' do
    expect(build(:term)).to be_valid
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

    it 'the presence of the :name attribute' do
      should validate_presence_of :name
    end

    it 'the presence of the :start_date attribute' do
      should validate_presence_of :start_date
    end

    it 'the presence of the :end_date attribute' do
      should validate_presence_of :end_date
    end

     it 'has_and_belongs_to_many :courses' do
      should has_and_belongs_to_many :courses
    end

  end
end