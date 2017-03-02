class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of [:email]
  has_many :orders
  has_one :address

  def full_name
    [self.first_name, self.last_name].join(' ')
  end
end
