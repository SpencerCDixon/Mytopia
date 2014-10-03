class NeighborhoodPhotosController < ApplicationController
  def create
    @neighborhood_photo = NeighborhoodPhoto.new(neighborhood_photo_params)
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @neighborhood_photo.user = current_user
    @neighborhood_photo.neighborhood_id = @neighborhood.id

    if @neighborhood_photo.save
      flash[:success] = "You have successfully submitted a picture of the neighborhood."
      redirect_to neighborhood_path(@neighborhood)
    else
      flash[:alert] = "You need to submit a photo."
      render 'neighborhoods/show'
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
  end

  private

  def neighborhood_photo_params
    return {neighborhood_id: nil} unless params[:neighborhood_photo]
    params.require(:neighborhood_photo).permit(:neighborhood_photo, :user_id, :neighborhood_id, :photo)
  end
end
