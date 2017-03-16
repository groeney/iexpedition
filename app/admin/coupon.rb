ActiveAdmin.register Coupon do

  permit_params :code, :discount_amount, :discount_type

end
