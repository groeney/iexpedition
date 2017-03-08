class Passport < ApplicationRecord
  belongs_to :user
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  has_attached_file :visa
  validates_attachment :visa, content_type: { content_type: /\Aimage\/.*\z/ }
end
