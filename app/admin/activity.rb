ActiveAdmin.register Activity do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :price

  index do
    selectable_column
    column "Voyage id" do |activity|
      link_to activity.voyage_id, admin_voyage_path(activity.voyage)
    end
    column "Voyage summary" do |activity|
      from = activity.voyage.start_date.strftime("%D")
      to = activity.voyage.end_date.strftime("%D")
      "#{activity.voyage.name}: #{from} to #{to}"
    end
    column :name
    column :price
    actions
  end
end
