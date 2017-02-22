ActiveAdmin.register InclusionGrouping do

  permit_params :inclusion_id, :voyage_id
  filter :inclusion
  filter :voyage, collection: Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] }

  index do
    selectable_column
    column "Voyage" do |ag|
      link_to ag.voyage.identifier_s, admin_voyage_path(ag.voyage)
    end
    column :inclusion
    actions
  end

  show do |ig|
    attributes_table do
      row :voyage do
        link_to ig.voyage.identifier_s, admin_voyage_path(ig.voyage)
      end
      row :inclusion
    end
  end

  form do |f|
    f.inputs "Inclusion Grouping Details" do
      f.input :inclusion
      f.input :voyage_id, as: :select, collection: Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] }
    end
    f.actions
  end
end
