class HighlightGrouping < ApplicationRecord
  belongs_to :highlight
  belongs_to :highlightable, polymorphic: true
end
