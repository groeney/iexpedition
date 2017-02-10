ActiveAdmin.register Region do

  permit_params :name, :overview, :destination_id
  filter :name
  filter :destination

  index do
    selectable_column
    column :name
    column :destination
    actions
  end

  show do |destination|
    attributes_table do
      row :name
      row :destination
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Region" do
      f.input :name
      f.input :overview
      f.input :destination
    end
    f.actions
  end
end
