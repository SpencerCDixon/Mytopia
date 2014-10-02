require 'rails_helper'

feature "Admin can update a neighborhood" do

  let(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "admin can click can go to update page for neighborhood" do
    neighborhood = FactoryGirl.create(:neighborhood)
    sign_in_as(admin)
    visit admin_neighborhoods_path

    click_on "Edit"
    expect(page).to have_content("Edit #{neighborhood.name}")
  end

  scenario "user cannot go to edit page for a neighborhood" do
    sign_in_as(user)
    visit admin_neighborhoods_path

    expect(page).to have_content("Invalid request")

  end

  scenario "admin edits a neighborhood" do
    neighborhood = FactoryGirl.create(:neighborhood)
    sign_in_as(admin)
    visit admin_neighborhoods_path

    click_on "Edit"
    expect(page).to have_content("Edit #{neighborhood.name}")

    fill_in('City', with: "Newtonville")
    fill_in('State', with: "New Hampshire")
    fill_in('Zipcode', with: "01012")

    click_on "Update Neighborhood"

    expect(page).to have_content("Newtonville")
  end

  scenario "admin deletes a neighborhood" do
    neighborhood = FactoryGirl.create(:neighborhood)
    sign_in_as(admin)
    visit admin_neighborhoods_path

    click_on "Delete"
    expect(page).to_not have_content(neighborhood.city)
  end
end
