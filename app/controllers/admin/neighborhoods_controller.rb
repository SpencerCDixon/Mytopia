class Admin::NeighborhoodsController < ApplicationController
  before_filter :authorize!
  def index
    @neighborhoods = Neighborhood.all
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
  end
end
