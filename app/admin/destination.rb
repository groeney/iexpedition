ActiveAdmin.register Destination do

  permit_params :name, :overview
  filter :name

  index do
    selectable_column
    column :name
    column :overview
    actions
  end

  show do |destination|
    attributes_table do
      row :name
      row :overview
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Destination" do
      f.input :name
      f.input :overview
    end
    f.actions
  end
end
