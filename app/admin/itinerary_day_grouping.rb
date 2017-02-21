ActiveAdmin.register ItineraryDayGrouping do
  permit_params :itinerary_day_id, :voyage_id, :day_number
  filter :voyage, collection: Proc.new { Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] } }
  filter :itinerary_day

  index do
    selectable_column
    column "Voyage" do |idg|
      link_to idg.voyage.identifier_s, admin_voyage_path(idg.voyage)
    end
    column :itinerary_day
    column :day_number
    actions
  end

  show do |idg|
    attributes_table do
      row :voyage do
        link_to idg.voyage.identifier_s, admin_voyage_path(idg.voyage)
      end
      row :itinerary_day
      row :day_number
    end
  end

  form do |f|
    f.inputs "Itinerary Day Grouping Details" do
      f.input :itinerary_day
      f.input :voyage_id, as: :select, collection: Proc.new { Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] } }
      f.input :day_number
    end
    f.actions
  end
end
