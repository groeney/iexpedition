class DestinationActivity < ApplicationRecord
  has_attached_file :image, default_url: "/assets/missing-activity.png", styles: { original: "512x512>", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }
end
