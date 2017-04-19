module WishlistHelper
  def ship_in_wishlist?(ship)
    json = cookies[:favourite_ship_ids]
    json = json.blank? ? '[]' : json
    (JSON.parse(json)).include?(ship.id)
  end

  def voyage_in_wishlist?(voyage)
    return false unless voyage.valid?
    json = cookies[:favourite_voyage_ids]
    json = json.blank? ? '[]' : json
    (JSON.parse(json)).include?(voyage.id)
  end
end