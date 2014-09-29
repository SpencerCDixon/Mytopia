class WelcomeController < ApplicationController
  def index
    if params[:search]
      @neighborhoods = Neighborhood.search(params[:search])
    end
  end
end
