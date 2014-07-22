require 'rails_helper'

describe Course do
  it 'has a valid factory' do
    expect(build(:course)).to be_valid
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
end