require 'rails_helper'

feature "Authorized users can update and delete their own reviews" do
  scenario 'wrong user cannot see the edit or delete button for reviews' do
    review = FactoryGirl.create(:review)
    authorized_user = review.user
    unauthorized_user = FactoryGirl.create(:user)

    sign_in_as(unauthorized_user)

    visit neighborhood_path(review.neighborhood)

    expect(page).to_not have_link('Edit')
    expect(page).to_not have_link('Delete')
  end
end
