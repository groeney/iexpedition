ActiveAdmin.register FeatureGrouping do

  permit_params :feature_id, :featurable_type, :featurable_id
  filter :featurable, collection: Proc.new { Feature.featurables.map { |featurable| [featurable.identifier_s, featurable.id] } }
  filter :featurable_type, collection: ["Cabin", "Ship"]
  filter :feature

  index do
    selectable_column
    column :feature
    column :featurable_type
    column :featurable
    actions
  end

  show do |fg|
    attributes_table do
      row :feature
      row :featurable_type
      row :featurable
    end
  end

  form do |f|
    f.inputs "Feature Grouping Details" do
      f.input :feature
      f.input :featurable_type, as: :select, collection: ["Cabin", "Ship"]
      f.input :featurable_id, as: :select, collection: Proc.new { Feature.featurables.map { |featurable| [featurable.identifier_s, featurable.id] } }
    end
    f.actions
  end
end
