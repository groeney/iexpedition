class FavouriteShipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @favourite_ship = current_user.favourite_ships.create(ship_id: ship_id)
    unless @favourite_ship.nil?
      # render js to update star
    else
      # handle error
    end
  end

  def destroy
    @favourite_ship = current_user.favourite_ships.find_by(ship_id: ship_id)
    unless @favourite_ship.nil?
      # render js to update star
    else
      # handle error
    end
  end

  protected

  def favourite_ship_params
    params.require(:favourite_ship).permit(:ship_id)
  end

  def ship_id
    favourite_ship_params[:ship_id]
  end
end
