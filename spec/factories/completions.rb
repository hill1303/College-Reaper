FactoryGirl.define  do
  factory :completion do
    grade ('AA'..'ZZ').to_a.sample
  end
end