class VoyagesController < ApplicationController
  def show
    @voyage = Voyage.find(params[:id])
  end
end
