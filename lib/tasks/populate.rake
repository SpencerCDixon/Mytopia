namespace :db do
  desc "Create 10 users with random names and reviews"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    User.populate(500) do |user|
      user.username = Faker::Name.first_name
      user.email = Faker::Internet.email
      user.encrypted_password = "testtest"
      user.sign_in_count = 3
      Review.populate(10) do |review|
        review.user_id = user.id
        review.title = Populator.words(3..10)
        review.body = Populator.paragraphs(1..2)
        review.rating = 0..10
        review.neighborhood_id = 0..6958
      end
    end
  end
end
