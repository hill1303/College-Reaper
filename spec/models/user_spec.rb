require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(build(:user, password: 'password123')).to be_valid
  end

  it 'belongs to a :person' do
    should belong_to :person
  end

  it 'has many :completions' do
    should have_many(:completions)
  end

  it 'has many :courses through :completions' do
    should have_many(:courses).through(:completions)
  end

  it 'has many :preferences' do
    should have_many(:preferences)
  end

  it 'has many :schedules' do
    should have_many(:schedules)
  end

  context 'attributes' do
    let :user do
      build :user, password: 'password123'
    end

    it 'includes a :uuid attribute' do
      expect(user.attributes).to include('uuid')
    end

    it 'includes a :rank attribute' do
      expect(user.attributes).to include('rank')
    end

    it 'includes a :email attribute' do
      expect(user.attributes).to include('email')
    end

    it 'includes a :encrypted_password attribute' do
      expect(user.attributes).to include('encrypted_password')
    end

    it 'includes a :reset_password_token attribute' do
      expect(user.attributes).to include('reset_password_token')
    end

    it 'includes a :reset_password_sent_at attribute' do
      expect(user.attributes).to include('reset_password_sent_at')
    end

    it 'includes a :remember_created_at attribute' do
      expect(user.attributes).to include('remember_created_at')
    end

    it 'includes a :sign_in_count attribute' do
      expect(user.attributes).to include('sign_in_count')
    end

    it 'includes a :current_sign_in_at attribute' do
      expect(user.attributes).to include('current_sign_in_at')
    end

    it 'includes a :last_sign_in_at attribute' do
      expect(user.attributes).to include('last_sign_in_at')
    end

    it 'includes a :current_sign_in_ip attribute' do
      expect(user.attributes).to include('current_sign_in_ip')
    end

    it 'includes a :last_sign_in_ip attribute' do
      expect(user.attributes).to include('last_sign_in_ip')
    end

    it 'includes a :confirmation_token attribute' do
      expect(user.attributes).to include('confirmation_token')
    end

    it 'includes a :confirmed_at attribute' do
      expect(user.attributes).to include('confirmed_at')
    end

    it 'includes a :confirmation_sent_at attribute' do
      expect(user.attributes).to include('confirmation_sent_at')
    end

    it 'includes a :unconfirmed_email attribute' do
      expect(user.attributes).to include('unconfirmed_email')
    end

    it 'includes a :failed_attempts attribute' do
      expect(user.attributes).to include('failed_attempts')
    end

    it 'includes a :unlock_token attribute' do
      expect(user.attributes).to include('unlock_token')
    end

    it 'includes a :locked_at attribute' do
      expect(user.attributes).to include('locked_at')
    end
  end

  context 'validates' do
    it 'the uniqueness of the :uuid attribute' do
      should validate_uniqueness_of :uuid
    end

    it 'the presence of the :uuid attribute' do
      should validate_presence_of :uuid
    end
  end
end
