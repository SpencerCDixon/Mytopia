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
      flash[:success] = "You have successfully created a review."
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
      flash[:success] = "You have successfully updated your review."
      redirect_to neighborhood_review_path(@review.neighborhood, @review)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    flash[:success] = "You have successfully deleted your review."

    redirect_to neighborhood_path(@review.neighborhood)
  end

  def upvote
    @review = Review.find(params[:review_id])
    @vote = Vote.find_or_create_by(user: current_user, review: @review)
    @vote.score += 1

    if @vote.save
      redirect_to @review.neighborhood
    else
      flash.now[:warning] = "Sign in to upvote!"
      @neighborhood = @review.neighborhood
      @reviews = @neighborhood.reviews
      @review = Review.new
      render 'neighborhoods/show'
    end
  end

  def downvote
    @review = Review.find(params[:review_id])
    @vote = Vote.find_or_create_by(user: current_user, review: @review)
    @vote.score -= 1

    if @vote.save
      redirect_to @review.neighborhood
    else
      flash.now[:notice] = "Can't vote more than once!"
      @neighborhood = @review.neighborhood
      @reviews = @neighborhood.reviews
      @review = Review.new
      render 'neighborhoods/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
