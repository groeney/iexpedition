ActiveAdmin.register Feature do

  permit_params :name, :overview, :icon
  filter :name

  index do
    selectable_column
    column :name
    column :icon
    actions
  end

  show do
    attributes_table do
      row :name
      row :overview
      row :icon
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Feature" do
      f.input :name
      f.input :overview
      f.input :icon
    end
    f.actions
  end

end
