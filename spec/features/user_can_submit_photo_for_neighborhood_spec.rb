require 'rails_helper'

feature "User can Submit Photo for neighborhood" do
  scenario "User submits photo prompted it was submitted successfuly" do
    neighborhood= FactoryGirl.create(:neighborhood)
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit neighborhood_path(neighborhood)

    attach_file "Photo", Rails.root.join('spec/fixtures/download.jpeg')

    click_on "Submit Photo"

    expect(page).to have_content("You have successfully submitted a picture of the neighborhood.")
  end

end
