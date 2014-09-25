class Admin::NeighborhoodsController < ApplicationController
  before_filter :authorize!
  def index
    @neighborhoods = Neighborhood.all
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
  end

  def update
    @neighborhood = Neighborhood.find(params[:id])

    if @neighborhood.update(neighborhood_params)
      redirect_to @neighborhood
    else
      render 'edit'
    end
  end

  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.destroy

    redirect_to admin_neighborhoods_path, notice: "Deleted neighborhood"
  end

  private
  def neighborhood_params
    params.require(:neighborhood).permit(:name,:city, :state, :zipcode)
  end
  #
  #   def update
  #   @question = Question.find(params[:id])
  #
  #   if @question.update(question_params)
  #     redirect_to @question
  #   else
  #     render 'edit'
  #   end
  # end
  #
  # private
  # def question_params
  #   params.require(:question).permit(:title, :description, :user_id)
  # end
end
