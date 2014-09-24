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

    expect(page).to have_content("You are not authorized to view this resource.")
    expect(current_path).to eq(root_path)
  end

  scenario "admin edits a neighborhood" do

  end
end
