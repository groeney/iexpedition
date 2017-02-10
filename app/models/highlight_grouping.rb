class HighlightGrouping < ApplicationRecord
  belongs_to :highlight
  belongs_to :highlightable, polymorphic: true

  validates_uniqueness_of :highlight_id, scope: [:highlightable_type, :highlightable_id], message: "highlight already exists for this resource"
end
