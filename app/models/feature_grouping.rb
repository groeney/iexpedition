class FeatureGrouping < ApplicationRecord
  belongs_to :feature
  belongs_to :featurable, polymorphic: true
end
