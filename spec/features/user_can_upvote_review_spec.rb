feature 'A user can upvote a review' do

  scenario 'user can upvote a review' do
    review = FactoryGirl.create(:review)

    sign_in_as(review.user)


  end

end
