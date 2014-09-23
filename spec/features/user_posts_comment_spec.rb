require 'rails_helper'

feature "Authenticated user can comment on reviews" do
  scenario "User can add comment to review" do
    review = FactoryGirl.create(:review)
    visit neighborhood_review_path(review)

    comment = FactoryGirl.build(:comment)
    fill_in('Body', with: comment.body)

    click_on 'Create Comment'

    expect(page).to have_content(comment.body)

  end


end
