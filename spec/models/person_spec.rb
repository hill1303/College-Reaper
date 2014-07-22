require 'rails_helper'

describe Person do
  it 'has a valid factory' do
    expect(build(:person)).to be_valid
  end

  it 'has one :user' do
    should have_one :user
  end

  context 'attributes' do
    let :person do
      build :person
    end

    it 'includes a :name attribute' do
      expect(person.attributes).to include('name')
    end

    it 'the presence of :name attribute' do
      should validate_presence_of :name
    end

    it 'includes a :dob attribute' do
      expect(person.attributes).to include('dob')
    end

    it 'the presence of :dob attribute' do
      should validate_presence_of :dob
    end

    it 'includes a :sex attribute' do
      expect(person.attributes).to include('sex')
    end

    it 'the presence of :sex attribute' do
      should validate_presence_of :sex
    end

    it 'includes a :gender attribute' do
      expect(person.attributes).to include('gender')
    end

    it 'includes a :pronoun attribute' do
      expect(person.attributes).to include('pronoun')
    end

    it 'includes a :title attribute' do
      expect(person.attributes).to include('title')
    end

    it 'includes a :suffix attribute' do
      expect(person.attributes).to include('suffix')
    end
  end  
end