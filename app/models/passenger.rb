class Passenger < ApplicationRecord
  belongs_to :order

  validates_presence_of [:order_id, :email, :first_name, :dob, :nationality, :gender]
end
