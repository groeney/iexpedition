ActiveAdmin.register Exclusion do

  permit_params :name, :voyage_id
  filter :name

  index do
    selectable_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Exclusion" do
      f.input :name
    end
    f.actions
  end

end
