class CabinGrouping < ApplicationRecord
  belongs_to :voyage
  belongs_to :cabin

  def notice_class
    return "sale" if self.discount_amount > 0
    case self.availability
    when 0..1
      "on-request"
    when 2..4
      "limited"
    else
      "available"
    end
  end
end
