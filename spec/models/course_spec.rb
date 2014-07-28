require 'rails_helper'

describe Course do
  it 'has a valid factory' do
    expect(build(:course)).to be_valid
  end

  it 'has many :sections' do
    should have_many :sections
  end

  it 'has many :pre_requisites (RequirementGroup)' do
    should have_many(:pre_requisites).class_name('RequirementGroup')
  end

  it 'has and belongs to many :terms' do
    should have_and_belong_to_many :terms
  end

  it 'has and belongs to many :course_groups' do
    should have_and_belong_to_many :course_groups
  end

  context 'attributes' do
    let :course do
      build :course
    end

    it 'has a :instructional_unit attribute' do
      expect(course.attributes).to include('instructional_unit')
    end

    it 'has a :course_number attribute' do
      expect(course.attributes).to include('course_number')
    end

    it 'has a :name attribute' do
      expect(course.attributes).to include('name')
    end

    it 'has a :credit_hours attribute' do
      expect(course.attributes).to include('credit_hours')
    end
  end

  context 'validates' do
    it 'the presence of :course_number' do
      should validate_presence_of :course_number
    end

    it 'the numbericality of :course_number' do
      should validate_numericality_of :course_number
    end

    it 'the presence of :instructional_unit' do
      should validate_presence_of :instructional_unit
    end

    it 'the presence of :name' do
      should validate_presence_of :name
    end

    it 'the presence of :credit_hours' do
      should validate_presence_of :credit_hours
    end

    it 'the numbericality of :credit_hours to be an integer' do
      should validate_numericality_of(:credit_hours).only_integer
    end
  end
end