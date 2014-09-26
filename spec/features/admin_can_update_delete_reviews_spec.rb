require 'rails_helper'

feature "Admin can update or delete review" do
  let(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "admin can update review" do
    review = FactoryGirl.create(:review)

    sign_in_as(admin)
    visit admin_neighborhood_review_path(review.neighborhood, review)

    click_on "Edit"
    expect(page).to have_content("Edit #{review.title}")

    fill_in "Title", with: "Updated Review"

    click_on "Update Review"

    expect(page).to have_content("Edit Update Review")
  end


end
