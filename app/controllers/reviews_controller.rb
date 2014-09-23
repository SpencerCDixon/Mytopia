class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.neighborhood_id = params[:neighborhood_id]

    if @review.save
      redirect_to @neighborhood
    else
      render 'neighborhoods/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
end
