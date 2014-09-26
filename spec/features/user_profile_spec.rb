require 'rails_helper'

feature "Authenticated user can view others' profiles" do

  scenario "user can view another user's profile" do
    review = FactoryGirl.create(:review)
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit user_path(review.user)
    expect(page).to have_content(review.title)
  end
end
