FactoryGirl.define  do
  factory :completion do
    grade ('A'..'Z').to_a.sample
  end
end