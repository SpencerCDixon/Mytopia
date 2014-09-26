require 'rails_helper'

feature "Reviewer receives email when their review is commented on" do
  scenario "user submits comment on review" do
    ActionMailer::Base.deliveries = []

    comment = FactoryGirl.build(:comment)

    sign_in_as(comment.user)

    visit neighborhood_review_path(comment.review.neighborhood, comment.review)

    fill_in 'Body', with: comment.body

    click_on "Create Comment"

    expect(page).to have_content(comment.body)
    expect(ActionMailer::Base.deliveries.size).to eql(1)

    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject("Your review was commented on.")
    expect(last_email).to deliver_to(comment.review.user.email)
  end
end
