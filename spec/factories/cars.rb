# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    color 'red'
    year 2012
    mileage 40000
    description 'This is more than just a red car'
  end
end
