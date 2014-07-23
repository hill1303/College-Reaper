require 'rails_helper'

describe CourseGroup do
  it 'has a valid factory' do
    expect(build(:course_group)).to be_valid
  end

  it 'belongs to a :college' do
    should belong_to :college
  end

  it 'has many :completion_rules (RequirementGroup)' do
    should have_many(:completion_rules).class_name('RequirementGroup')
  end

  context 'attributes' do
    let :course_group do
      build :course_group
    end

    it 'includes a :name attribute' do
      expect(course_group.attributes).to include('name')
    end

    it 'includes a :course_global attribute' do
      expect(course_group.attributes).to include('college_global')
    end

    it 'includes a :course_independent attribute' do
      expect(course_group.attributes).to include('college_independent')
    end
  end

  context 'validates' do
    it 'the presence of :name' do
      should validate_presence_of :name
    end

    it 'the uniqueness of :name' do
      should validate_uniqueness_of :name
    end
  end
end