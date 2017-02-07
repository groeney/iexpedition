class Region < ApplicationRecord
  belongs_to :destination

  has_many :highlight_groupings, as: :highlightable
  has_many :wildlife_groupings, as: :wildlifable

  has_many :wildlives, through: :wildlife_groupings
  has_many :highlights, through: :highlight_groupings
  has_many :histories, through: :destination
  has_many :facts, through: :destination
end
