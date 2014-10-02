# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :neighborhood do
    city "Newton"
    state "MA"
    zipcode "02151"
  end
end
