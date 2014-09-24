FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    sequence(:username) { |n| "user_name#{n}" }
    password "12345678910"
    admin false
  end

  factory :admin, class: User do
    email "Admin@email.com"
    username  "Admin"
    password "12345678"
    admin true
  end
end
