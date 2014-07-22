require 'rails_helper'

describe Term do
  it 'has a valid factory' do
    expect(build(:term)).to be_valid
  end

  context 'attributes' do
    let :term do
      build :term
    end

    it 'has a :name attribute' do
      expect(term.attributes).to include('name')
    end

    it 'has a :start_date attribute' do
      expect(term.attributes).to include('start_date')
    end

    it 'has a :end_date attribute' do
      expect(term.attributes).to include('end_date')
    end
  end
end