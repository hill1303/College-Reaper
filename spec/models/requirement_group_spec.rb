require 'rails_helper'

describe RequirementGroup do
  it 'has a valid factory' do
    expect(build(:requirement_group)).to be_valid
  end

  it 'belongs to an :owner (polymorphic)' do
    should belong_to :owner
  end

  it 'has and belongs to many :courses' do
    should have_and_belong_to_many :courses
  end

  context 'attributes' do
    let :requirement_group do
      build :requirement_group
    end

    it 'includes a :name attribute' do
      expect(requirement_group.attributes).to include('name')
    end

    it 'includes a :rule attribute' do
      expect(requirement_group.attributes).to include('rule')
    end
  end

  context 'validates' do
    it 'the presence of :name' do
      should validate_presence_of :name
    end

    it 'the presence of :rule' do
      should validate_presence_of :rule
    end
  end
end