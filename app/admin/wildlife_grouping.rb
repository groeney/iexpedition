ActiveAdmin.register WildlifeGrouping do

  permit_params :wildlife_id, :wildlifable_type, :wildlifable_id
  filter :wildlifable, collection: Wildlife.wildlifables.map { |wildlifable| [wildlifable.identifier_s, wildlifable.id] }
  filter :wildlifable_type, collection: ["Region", "Voyage"]
  filter :wildlife

  index do
    selectable_column
    column :wildlife
    column :wildlifable_type
    column :wildlifable
    actions
  end

  show do |fg|
    attributes_table do
      row :wildlife
      row :wildlifable_type
      row :wildlifable
    end
  end

  form do |f|
    f.inputs "Wildlife Grouping Details" do
      f.input :wildlife
      f.input :wildlifable_type, as: :select, collection: ["Region", "Voyage"]
      f.input :wildlifable_id, as: :select, collection: Wildlife.wildlifables.map { |wildlifable| [wildlifable.identifier_s, wildlifable.id] }
    end
    f.actions
  end
end
