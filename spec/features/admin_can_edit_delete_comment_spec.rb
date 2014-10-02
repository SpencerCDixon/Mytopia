require 'rails_helper'

feature "Admin can update or delete comment" do
  let(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "admin can update comment" do
    comment = FactoryGirl.create(:comment)

    sign_in_as(admin)
    visit admin_neighborhood_review_path(comment.review.neighborhood, comment.review)

    click_on "Edit"
    expect(page).to have_content(comment.body)

    fill_in "Body", with: "New title"
    click_on "Update comment"

    expect(page).to have_content("New title")
  end

  scenario "admin can delete comment" do
    comment = FactoryGirl.create(:comment)

    sign_in_as(admin)
    visit admin_neighborhood_review_path(comment.review.neighborhood, comment.review)

    click_on "Delete"
    expect(page).to_not have_content(comment.body)
  end
end
