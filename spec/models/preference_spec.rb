require 'rails_helper'

describe Preference do
  it 'has a valid factory' do
    expect(build(:preference)).to be_valid
  end

  it 'belongs to a :user' do
    should belong_to :user
  end

  it 'belongs to a :schedule' do
    should belong_to :schedule
  end

  it 'belongs to a :term' do
    should belong_to :term
  end

  context 'attributes' do
    let :preference do
      build :preference
    end

    it 'has a :choices attribute' do
      expect(preference.attributes).to include('choices')
    end
  end
end
