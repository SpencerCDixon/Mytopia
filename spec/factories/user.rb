FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password "12345678910"
  end
end
