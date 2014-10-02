class Admin::CommentsController < ApplicationController
  before_filter :admin_authorize!

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(neighborhood_params)
      redirect_to admin_neighborhood_review_path(@comment.review.neighborhood, @comment.review)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to admin_neighborhood_review_path(@comment.review.neighborhood, @comment.review), flash: { success: "Deleted comment" }
  end

  private

  def neighborhood_params
    params.require(:comment).permit(:title, :body)
  end
end
