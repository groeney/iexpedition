class Voucher < ApplicationRecord

  belongs_to :order

  has_attached_file :document
  validates_attachment_content_type :document, content_type: %w(application/pdf)

  validates :document, :link_name, presence: true

end
