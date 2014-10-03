require 'rails_helper'

feature "Admin can see a list of neighborhoods" do

  let(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "admin visits neighborhood index" do
    sign_in_as(admin)
    click_on "Edit Neighborhoods"

    expect(page).to have_content('Neighborhoods Admin')
  end

  scenario 'unauthorized users are redirected' do
    sign_in_as(user)
    visit admin_neighborhoods_path

    expect(page).to have_content("Invalid request")
    expect(current_path).to eq(root_path)
  end

  scenario "admin can search for neighborhood" do
    neighborhood = FactoryGirl.create(:neighborhood)
    sign_in_as(admin)
    visit admin_neighborhoods_path
    fill_in("search", with: neighborhood.name)

    find('#search-button').click

    expect(page).to have_content(neighborhood.name)
  end

end
