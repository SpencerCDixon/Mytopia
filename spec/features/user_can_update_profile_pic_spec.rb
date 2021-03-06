require 'rails_helper'
feature "user can update own profile picture" do
  scenario "user can update own profile picture" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit user_path(user)

    attach_file "Profile photo", Rails.root.join('spec/fixtures/profile.jpg')

    click_on 'Update Photo'

    expect(page).to have_content("You have successfully updated your profile picture")
  end
end
