require 'rails_helper'

feature "Authenticated user can comment on reviews" do
  scenario "User can add comment to review" do
    review = FactoryGirl.create(:review)

    sign_in_as(review.user)

    visit neighborhood_review_path(review.neighborhood, review)

    comment = FactoryGirl.build(:comment)
    fill_in('Body', with: comment.body)

    click_on 'Create Comment'

    expect(page).to have_content(comment.body)

  end
end
