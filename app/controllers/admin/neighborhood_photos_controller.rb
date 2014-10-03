class Admin::NeighborhoodPhotosController < ApplicationController
  def show
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
  end

  def edit
    @neighborhood_photo = NeighborhoodPhoto.find(params[:id])
  end

  def update
    @neighborhood_photo = NeighborhoodPhoto.find(params[:id])

    if @neighborhood_photo.update(neighborhood_photo_params)
      redirect_to admin_neighborhood_neighborhood_photo_path(@neighborhood_photo.neighborhood, @neighborhood_photo)
    else
      render 'edit'
    end
  end

  def destroy
    @neighborhood_photo = NeighborhoodPhoto.find(params[:id])
    @neighborhood_photo.destroy
    @neighborhood = Neighborhood.find(params[:neighborhood_id])

    redirect_to admin_neighborhood_neighborhood_photo_path(@neighborhood, @neighborhood.neighborhood_photos), flash: { success: "Deleted Photo" }
  end

  private

  def neighborhood_photo_params
    params.require(:neighborhood_photo).permit(:photo, :featured, :approved)
  end
end
