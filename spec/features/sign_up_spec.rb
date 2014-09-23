require 'rails_helper'

feature "user signs up" do
  scenario "user submits correct data" do
    user = FactoryGirl.build(:user)
    visit root_path

    click_on "sign up"

    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password)

    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end


end
