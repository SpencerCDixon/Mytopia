require 'rails_helper'
feature 'A user can update their own comments' do

  scenario 'authenticated user can update a comment' do
    comment = FactoryGirl.create(:comment)

    sign_in_as(comment.user)
    visit edit_neighborhood_review_comment_path(comment.review.neighborhood, comment.review, comment)

    fill_in('Body', with: comment.body)

    click_on 'Update Comment'

    expect(page).to have_content("You have successfully updated your comment.")
  end

  scenario 'authenticated user fills out incorrectly' do
    comment = FactoryGirl.create(:comment)

    sign_in_as(comment.user)

    visit edit_neighborhood_review_comment_path(comment.review.neighborhood, comment.review, comment)

    fill_in('Body', with: '')

    click_on 'Update Comment'

    expect(page).to have_content("Please correct changes.")
  end

  scenario 'authenticated user can delete their comment' do
    comment = FactoryGirl.create(:comment)

    sign_in_as(comment.user)

    visit neighborhood_review_path(comment.review.neighborhood, comment.review)

    click_on 'Delete'

    expect(page).to have_content("You successfully deleted your comment.")
  end
end
