class FavouriteVoyagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favourite_voyage = current_user.favourite_voyages.create(voyage_id: voyage_id)
    unless @favourite_voyage.nil?
      # render js to update star
    end
  end

  def destroy
    @favourite_voyage = current_user.favourite_voyages.find_by(voyage_id: voyage_id)
    unless @favourite_voyage.nil?
      # render js to update star
    end
  end

  protected

  def favourite_voyage_params
    params.require(:favourite_voyage).permit(:voyage_id)
  end

  def voyage_id
    favourite_voyage_params[:voyage_id]
  end
end
