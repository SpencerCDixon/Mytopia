require 'rails_helper'

feature "Authorized users can update and delete their own comments" do
  scenario 'wrong user cannot see the edit or delete button for comments' do
    comment = FactoryGirl.create(:comment)
    unauthorized_user =comment.review.user

    sign_in_as(unauthorized_user)

    visit neighborhood_review_path(comment.review.neighborhood, comment.review)

    expect(page).to_not have_link('Edit')
    expect(page).to_not have_link('Delete')
  end
end
