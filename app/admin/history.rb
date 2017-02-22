ActiveAdmin.register History do

  permit_params :name, :overview, :destination_id
  filter :name
  filter :destination

  index do
    selectable_column
    column :name
    column :overview
    column :destination
    actions
  end

  show do
    attributes_table do
      row :name
      row :overview
      row :destination
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "History" do
      f.input :name
      f.input :overview
      f.input :destination
    end
    f.actions
  end

end
