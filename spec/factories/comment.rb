FactoryGirl.define do
  factory :comment do
    body "This review sucks"

    association :review
  end
end
