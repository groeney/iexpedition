ActiveAdmin.register ExclusionGrouping do

  permit_params :exclusion_id, :voyage_id
  filter :voyage, collection: Proc.new { Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] } }
  filter :exclusion

   index do
    selectable_column
    column "Voyage" do |eg|
      link_to eg.voyage.identifier_s, admin_voyage_path(eg.voyage)
    end
    column :exclusion
    actions
  end

  show do |eg|
    attributes_table do
      row :voyage do
        link_to eg.voyage.identifier_s, admin_voyage_path(eg.voyage)
      end
      row :exclusion
    end
  end

  form do |f|
    f.inputs "Exclusion Grouping Details" do
      f.input :exclusion
      f.input :voyage_id, as: :select, collection: Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] }
    end
    f.actions
  end
end
