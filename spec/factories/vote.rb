FactoryGirl.define do
  factory :vote do
    score 1

    association :review
    association :user
  end
end
