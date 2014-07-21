require 'rails_helper'

describe College do
  it 'has a valid factory' do
    expect(build(:college)).to be_valid
  end

  context 'attributes' do
    let :college do
      build :college
    end

    it 'includes a :name attribute' do
      expect(college.attributes).to include('name')
    end
  end

  context 'validates' do
    it 'the uniqueness of the :name attribute' do
      should validate_uniqueness_of(:name)
    end
  end
end