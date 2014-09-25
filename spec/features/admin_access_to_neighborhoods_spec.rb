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

    expect(page).to have_content("You are not authorized to view this resource.")
    expect(current_path).to eq(root_path)
  end

end
