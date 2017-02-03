ActiveAdmin.register Ship do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :operator_name, :category, :currency, :payment_prior

  index do
    selectable_column
    column :name
    column :operator_name
    column :category
    column :currency
    column :payment_prior
    actions
  end

end
