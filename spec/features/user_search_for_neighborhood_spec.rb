require 'rails_helper'
feature "anyone can search for neighborhood" do
  scenario "anyone can search for neighborhood" do
    neighborhood = FactoryGirl.create(:neighborhood)
    user = FactoryGirl.create(:user)

    visit neighborhoods_path(neighborhood)
    fill_in("search", with: neighborhood.name)

    find('#search-button').click

    expect(page).to have_content(neighborhood.name)
  end
end
