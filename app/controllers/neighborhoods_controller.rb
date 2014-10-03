class NeighborhoodsController < ApplicationController
  def index
    if params[:search]
      @neighborhoods = Neighborhood.search(params[:search]).order(:name).page params[:page]
    else
      @neighborhoods = Neighborhood.order(:zipcode).page params[:page]
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @review = Review.new
    @reviews = @neighborhood.reviews.with_score.includes(:votes).page params[:page]
    @neighborhood_photo = NeighborhoodPhoto.new
  end

  # def new
  #   @neighborhood = Neighborhood.new
  # end

  # def create
  #   @neighborhood = Neighborhood.new(neighborhood_params)
  #
  #   if @neighborhood.save
  #     redirect_to @neighborhood
  #   else
  #     render 'new'
  #   end
  # end
  #
  # def update
  #   @neighborhood = Neighborhood.find(params[:id])
  #
  #   if @neighborhood.update(neighborhood_params)
  #     flash[:success] = "You have successfully updated the neighborhood picture."
  #     redirect_to neighborhood_path(@neighborhood)
  #   else
  #     render "show"
  #   end
  # end

  private
  def neighborhood_params
    params.require(:neighborhood).permit(:city, :state, :zipcode, :name, :photo)
  end
end
