require 'rails_helper'

describe Completion do
  it 'has a valid factory' do
    expect(build(:completion)).to be_valid
  end

  it 'belongs to a :user' do
    should belong_to :user
  end

  it 'belongs to a :course' do
    should belong_to :course
  end

  context 'attributes' do
    let :completion do
      build(:completion)
    end

    it 'includes a :grade attribute' do
      expect(completion.attributes).to include('grade')
    end
  end

  context 'validates' do
    it 'the presence of :grade' do
      should validate_presence_of :grade
    end

    it 'the length of :grade' do
      should ensure_length_of(:grade).is_equal_to(2)
    end
  end
end