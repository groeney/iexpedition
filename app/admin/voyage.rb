ActiveAdmin.register Voyage do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :overview, :start_date, :end_date, :embark_port, :disembark_port, :discount_percentage
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    column :ship
    column :name
    column :start_date
    column :end_date
    column :discount_percentage
    actions
  end


end
