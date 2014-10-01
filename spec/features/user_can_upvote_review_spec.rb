require 'rails_helper'

feature 'A user can upvote a review' do

  scenario 'user can upvote a review' do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit neighborhood_path(review.neighborhood, review)

    click_on 'Upvote'
    expect(page).to have_content('1')
  end

end
