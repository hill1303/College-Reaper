FactoryGirl.define do
  factory :user do
    uuid                   '2800065693'
    rank                   3
    email                 'john@doe.net'
    password              'pass123'
    password_confirmation { self.password }
    person                { build(:person) }
  end
end