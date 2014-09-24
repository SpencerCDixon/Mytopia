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

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to neighborhood_review_path(@review.neighborhood, @review)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to neighborhood_path(@review.neighborhood)
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
end
