class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of [:email]
  has_many :orders
  has_one :address
  has_one :passport
  has_one :emergency_contact
  has_one :travel_detail_post, as: :travel_detail
  has_one :travel_detail_pre, as: :travel_detail
  has_many :favourite_voyages
  has_many :favourite_ships

  def wishlist
    self.favourite_voyages + self.favourite_ships
  end

  def full_name
    [self.first_name, self.last_name].join(' ')
  end
end
