class Admin::NeighborhoodsController < ApplicationController
  before_filter :authorize!
  def index
    @neighborhoods = Neighborhood.all
  end
end
