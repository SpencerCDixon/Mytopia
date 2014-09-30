FactoryGirl.define do
  factory :review do
    title "Newton is safest town in America"
    body "No crime"
    rating "5"

    association :neighborhood
    association :user
  end
end
