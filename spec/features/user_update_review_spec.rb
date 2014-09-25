feature 'A user can update their own review' do

  scenario 'authenticated user can update a review' do
    review = FactoryGirl.create(:review)

    sign_in_as(review.user)
    visit edit_neighborhood_review_path(review.neighborhood, review)

    fill_in('Title', with: review.title)
    fill_in('Body', with: review.body)

    click_on 'Update Review'

    expect(page).to have_content("You have successfully updated your review.")
  end
end
