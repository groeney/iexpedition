module WishlistHelper
  def ship_in_wishlist?(ship)
    (JSON.parse(cookies[:favourite_ship_ids] || '[]')).include?(ship.id)
  end

  def voyage_in_wishlist?(voyage)
    return false unless voyage.valid?
    (JSON.parse(cookies[:favourite_voyage_ids] || '[]')).include?(voyage.id)
  end
end