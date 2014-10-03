require 'rails_helper'

feature "user can edit their profile" do
  scenario "user navigates to edit user page" do
    user = FactoryGirl.build(:user)
    visit root_path

    click_on "Update"
    fill_in('Email', with: user.email)
    fill_in('Username', with: user.username)
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password)
    fill_in('Current password', with: "12345678910")

    click_on 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end

end
