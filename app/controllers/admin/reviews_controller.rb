class Admin::ReviewsController < ApplicationController
  before_filter :admin_authorize!
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(neighborhood_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to admin_neighborhood_reviews_path, flash: { success: "Deleted review" }
  end

  private

  def neighborhood_params
    params.require(:review).permit(:title, :body)
  end
end
