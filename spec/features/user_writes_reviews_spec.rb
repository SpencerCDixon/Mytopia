require 'rails_helper'

feature "authenticated user can write reviews" do
  scenario "user can go to all neigborhoods" do
    visit root_path

    click_on 'Find Neighborhood'
    expect(page).to have_content("Neighborhoods")
  end

  scenario 'authenticated user creates review' do
    user = FactoryGirl.create(:user)
    neighborhood = FactoryGirl.create(:neighborhood)
    review = FactoryGirl.build(:review)

    sign_in_as(user)
    visit neighborhood_path(neighborhood)

    fill_in('Title', with: review.title)
    fill_in('Body', with: review.body)
    select('1', from: 'Rating')

    click_on 'Create Review'

    expect(page).to have_content("You have successfully created a review.")
  end

  scenario 'authenticated user cannot create a blank review' do
    user = FactoryGirl.create(:user)
    neighborhood = FactoryGirl.create(:neighborhood)

    sign_in_as(user)
    visit neighborhood_path(neighborhood)

    click_on 'Create Review'

    expect(page).to have_content('prohibited')
  end

  scenario 'unauthenticated user cannot see the review form' do
    user = FactoryGirl.create(:user)
    neighborhood = FactoryGirl.create(:neighborhood)

    visit neighborhood_path(neighborhood)

    expect(page).to have_no_content('Create Review')
  end

  scenario 'unauthenticated user see the link to sign up page' do
    user = FactoryGirl.create(:user)
    neighborhood = FactoryGirl.create(:neighborhood)

    visit neighborhood_path(neighborhood)

    expect(page).to have_content('If you want to leave a review, please log in.')
  end
end
