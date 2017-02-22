ActiveAdmin.register WildlifeGrouping do

  permit_params :wildlife_id, :destination_id
  filter :destination
  filter :wildlife

  index do
    selectable_column
    column :wildlife
    column :destination
    actions
  end

  show do |wg|
    attributes_table do
      row :wildlife
      row :destination
    end
  end

  form do |f|
    f.inputs "Wildlife Grouping Details" do
      f.input :wildlife
      f.input :destination
    end
    f.actions
  end
end
