require 'rails_helper'

feature "Admin can update or delete review" do
  let(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "admin can update review" do
    review = FactoryGirl.create(:review)

    sign_in_as(admin)
    visit admin_neighborhood_path(review.neighborhood)

    click_on "Edit"
    expect(page).to have_content("Edit #{review.title}")

    fill_in "Title", with: "New title"

    click_on "Update Review"

    expect(page).to have_content("New title")
  end

  scenario "if admin updates review incorrectly, prompt with error message" do
    review = FactoryGirl.create(:review)

    sign_in_as(admin)
    visit admin_neighborhood_path(review.neighborhood)

    click_on "Edit"
    expect(page).to have_content("Edit #{review.title}")

    fill_in "Title", with: ""

    click_on "Update Review"

    expect(page).to have_content("prohibited")
  end

  scenario "admin can delete review" do
    review = FactoryGirl.create(:review)

    sign_in_as(admin)
    visit admin_neighborhood_path(review.neighborhood)

    click_on "Delete"
    expect(page).to_not have_content(review.body)
  end
end
