require 'rails_helper'

describe Location do
  it 'has a valid factory' do
    expect(build(:location)).to be_valid
  end

  context 'attributes' do
    let :location do
      build :location
    end
    
    it 'has a :name attribute' do
      expect(location.attributes).to include('name')
    end

    it 'has a :latitude attribute' do
      expect(location.attributes).to include('latitude')
    end

    it 'has a :longitude attribute' do
      expect(location.attributes).to include('longitude')
    end

    it 'has a :street1 attribute' do
        expect(location.attributes).to include('street1')
      end

    it 'has a :street2 attribute' do
        expect(location.attributes).to include('street2')
      end

    it 'has a :city attribute' do
        expect(location.attributes).to include('city')
      end

    it 'has a :state attribute' do
      expect(location.attributes).to include('state')
    end

    it 'has a :zip attribute' do
      expect(location.attributes).to include('zip')
    end
  end
end