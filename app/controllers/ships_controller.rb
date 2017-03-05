class ShipsController < ApplicationController
  def show
    @ship = Ship.find(params[:id])
    @destination = @ship.destinations.first || Destination.first
  end
end
