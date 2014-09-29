class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.order(:zipcode).page params[:page]
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @review = Review.new
    @reviews = @neighborhood.reviews
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    if @neighborhood.save
      redirect_to @neighborhood
    else
      render 'new'
    end
  end

  private
  def neighborhood_params
    params.require(:neighborhood).permit(:city, :state, :zipcode, :name)
  end
end
