class FavouriteVoyage < ApplicationRecord
  belongs_to :voyages
  belongs_to :user
end
