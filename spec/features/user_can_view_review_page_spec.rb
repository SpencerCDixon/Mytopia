require 'rails_helper'
feature "anyone can view a review show page" do
  scenario "Auth user clicks on review link" do
    review = FactoryGirl.create(:review)

    visit neighborhood_path(review.neighborhood)

    click_on review.title

    expect(page).to have_content(review.title)
    expect(page).to have_content(review.body)
  end
end
