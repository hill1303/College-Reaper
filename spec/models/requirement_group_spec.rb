require 'rails_helper'

describe RequirementGroup do
  it 'has a valid factory' do
    expect(build(:requirement_group)).to be_valid
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
end