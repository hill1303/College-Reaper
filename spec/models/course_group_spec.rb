require 'rails_helper'

describe CourseGroup do
  it 'has a valid factory' do
    expect(build(:course_group)).to be_valid
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
end