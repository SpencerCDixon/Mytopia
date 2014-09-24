class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.review_id = params[:review_id]
    if @comment.save
      redirect_to neighborhood_review_path(@review.neighborhood, @review)
    else
      render 'reviews/show'
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
