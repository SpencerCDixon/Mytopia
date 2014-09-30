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
      redirect_to admin_neighborhood_review_path(@review.neighborhood, @review)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to admin_neighborhood_path(@review.neighborhood), flash: { success: "Deleted review" }
  end

  private

  def neighborhood_params
    params.require(:review).permit(:title, :body)
  end
end
