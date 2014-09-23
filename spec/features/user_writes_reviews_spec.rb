require 'rails_helper'

feature "authenticated user can write reviews" do
  scenario "user can go to all neigborhoods" do
    visit root_path

    click_on 'All Neighborhoods'
    expect(page).to have_content("Neighborhoods")
  end

  scenario "reviews exist on neighborhood page" do
    neighborhood = FactoryGirl.build(:neighborhood)
    visit new_neighborhood_path
    fill_in('City', with: neighborhood.city)
    fill_in('State', with: neighborhood.state)
    fill_in('Zipcode', with: neighborhood.zipcode)

    click_on 'Create Neighborhood'

    expect(page).to have_content(neighborhood.city)

    expect(page).to have_content("Review #{neighborhood.city}")
  end

  scenario 'authenticated user creates review' do
    user = FactoryGirl.create(:user)
    neighborhood = FactoryGirl.create(:neighborhood)
    review = FactoryGirl.build(:review)

    sign_in_as(user)
    visit neighborhood_path(neighborhood)

    fill_in('Title', with: review.title)
    fill_in('Body', with: review.body)

    click_on 'Create Review'

  end
end



