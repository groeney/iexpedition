class FeatureGrouping < ApplicationRecord
  belongs_to :feature
  belongs_to :featurable, polymorphic: true

  validates_uniqueness_of :feature_id, scope: [:featurable_type, :featurable_id], message: "feature already exists for this resource"

  def featurable_path
    self.featurable.class.to_s == "Ship" ? admin_ship_path(fg.featurable) : admin_cabin_path(fg.featurable)
  end
end
