class ShipsController < ApplicationController
  def show
    @ship = Ship.find(params[:id])
  end
end
