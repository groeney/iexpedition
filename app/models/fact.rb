class Fact < ApplicationRecord
  belongs_to :destination

  has_attached_file :image, default_url: "/assets/missing.png"

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }
  validates_uniqueness_of :question, scope: :answer, message: "question answer already exists"
  validates_presence_of [:destination, :question, :answer]
end
