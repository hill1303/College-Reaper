require 'rails_helper'

describe Schedule do
  it 'has a valid factory' do
    expect(build(:schedule)).to be_valid
  end

  it 'belongs to a :user' do
    should belong_to :user
  end

  it 'has and belongs to many :sections' do
    should have_and_belong_to_many :sections
  end

  it 'belongs to a :term' do
    should belong_to :term
  end

  it 'has one :preference' do
    should have_one :preference
  end

  context 'attributes' do
    let :schedule do
      build :schedule
    end

    it 'includes a :score attribute' do
      expect(schedule.attributes).to include('score')
    end

    it 'includes a :sub_scores attribute' do
      expect(schedule.attributes).to include('sub_scores')
    end
  end

  context 'validates' do
    it 'the presence of the :score attribute' do
      should validate_presence_of :score
    end

    it 'the numericality of the :score attribute' do
      should validate_numericality_of :score
    end
  end
end
