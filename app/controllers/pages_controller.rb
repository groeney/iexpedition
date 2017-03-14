class PagesController < ApplicationController
  def search
    @results = Voyage.all.group_by(&:name)
  end

  def ship_listing
    @results = Ship.all
  end

  def wishlist
    @voyages = Voyage.where(id: JSON.parse(cookies[:favourite_voyage_ids] || []))
    @ships = Ship.where(id: JSON.parse(cookies[:favourite_ship_ids] || []))
  end
end
