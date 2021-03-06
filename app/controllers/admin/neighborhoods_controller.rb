class Admin::NeighborhoodsController < ApplicationController
  before_filter :admin_authorize!
  def index
    if params[:search]
      @neighborhoods = Neighborhood.search(params[:search]).order(:name).page params[:page]
    else
      @neighborhoods = Neighborhood.order(:zipcode).page params[:page]
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
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

    redirect_to admin_neighborhoods_path, flash: { success: "Deleted neighborhood" }
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name,:city, :state, :zipcode)
  end
end
