ActiveAdmin.register Cabin do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :price, :single_supplement, :description

  index do
    selectable_column
    column "Voyage id" do |cabin|
      link_to cabin.voyage_id, admin_voyage_path(cabin.voyage)
    end
    column "Voyage summary" do |cabin|
      from = cabin.voyage.start_date.strftime("%D")
      to = cabin.voyage.end_date.strftime("%D")
      "#{cabin.voyage.name}: #{from} to #{to}"
    end
    column :name
    column :price
    column :single_supplement
    actions
  end

end
