require 'rails_helper'

feature "Authenticated user can comment on reviews" do
  scenario "User can add comment to review" do
    review = FactoryGirl.create(:review)

    sign_in_as(review.user)

    visit neighborhood_review_path( review.neighborhood, review )

    comment = FactoryGirl.build(:comment)
    fill_in('Body', with: comment.body)

    click_on 'Create Comment'

    expect(page).to have_content(comment.body)
    expect(page).to have_content("You have successfully posted your comment.")

  end

  scenario "comment form is not visible" do
    review = FactoryGirl.create(:review)

    visit neighborhood_review_path( review.neighborhood, review )

    expect(page).to_not have_button('Create Comment')
  end

  scenario "notifies user to sign in if they want to comment" do
    review = FactoryGirl.create(:review)

    visit neighborhood_review_path( review.neighborhood, review )

    expect(page).to have_link('Sign in to comment')

  end

  scenario "user clicks on sign in link brings to sign in page" do
    review = FactoryGirl.create(:review)

    visit neighborhood_review_path( review.neighborhood, review )

    expect(page).to have_link('Sign in to comment')

    click_on 'Sign in to comment'

    expect(page).to  have_content("Log in")
  end

  scenario "authenticated user sees error message if comment form filled out incorrectly" do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in_as(user)
    visit neighborhood_review_path(review.neighborhood, review)

    click_on 'Create Comment'

    expect(page).to have_content('prohibited')
  end

end
