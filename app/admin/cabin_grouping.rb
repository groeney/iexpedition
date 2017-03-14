ActiveAdmin.register CabinGrouping do

  permit_params :cabin_id, :voyage_id, :availability, :discount_amount

  filter :cabin
  filter :voyage, collection: Proc.new { Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] } }

  index do
    selectable_column
    column "Voyage" do |cg|
      link_to cg.voyage.identifier_s, admin_voyage_path(cg.voyage)
    end
    column "Voyage ID" do |cg|
      cg.voyage_id
    end
    column "Cabin" do |cg|
      link_to cg.cabin.identifier_s, admin_cabin_path(cg.cabin)
    end
    column "Cabin ID" do |cg|
      cg.cabin_id
    end
    column :availability
    column :discount_amount
    actions
  end

  show do |cg|
    attributes_table do
      row :voyage do
        link_to cg.voyage.identifier_s, admin_voyage_path(cg.voyage)
      end
      row :cabin do
        link_to cg.cabin.identifier_s, admin_cabin_path(cg.cabin.identifier_s)
      end
      row :availability
      row :discount_amount
    end
  end

  form do |f|
    f.inputs "Cabin Grouping Details" do
      f.input :cabin_id, as: :select, collection: Cabin.all.map { |cabin| [cabin.identifier_s, cabin.id] }
      f.input :voyage_id, as: :select, collection: Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] }
      f.input :availability
      f.input :discount_amount
    end
    f.actions
  end
end
