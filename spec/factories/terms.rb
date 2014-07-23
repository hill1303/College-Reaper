FactoryGirl.define  do
  factory :term do
    name        'Spring'
    start_date  Date.new(2014, 1, 10)
    end_date    Date.new(2014, 4, 30)
  end
end