require 'rails_helper'

feature 'A user can upvote a review' do

  scenario 'user has to log in upvote' do
    review = FactoryGirl.create(:review)

    visit neighborhood_path(review.neighborhood, review)

    click_on 'Upvote'
    expect(page).to have_content('Log In to upvote!')

  end

  scenario 'user can upvote a review' do
    review = FactoryGirl.create(:review)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit neighborhood_path(review.neighborhood, review)

    click_on 'Upvote'
    expect(page).to have_content('1')
  end

    scenario 'user can downvote a review' do
    review = FactoryGirl.create(:review)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit neighborhood_path(review.neighborhood, review)
    click_on 'Upvote'

    visit neighborhood_path(review.neighborhood, review)

    click_on 'Downvote'
    expect(page).to have_content('0')
  end
end
