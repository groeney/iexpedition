ActiveAdmin.register Voyage do
  permit_params :name, :overview, :start_date, :end_date, :embark_port,
                :disembark_port, :discount_percentage, :overview_tile,
                :passenger_capacity, :physical_rating, :includes_flight,
                :destination_id, :region_id, :map
  filter :ship
  filter :destination
  filter :region

  index do
    selectable_column
    column :ship
    column :name
    column :start_date
    column :end_date
    column :discount_percentage
    column "Map", sortable: false do |voyage|
      link_to "<img src='#{voyage.map.url}' alt='voyage map' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, voyage.map.url
    end
    actions
  end

  show do |voyage|
    attributes_table do
      row :name
      row :overview
      row :start_date
      row :end_date
      row :embark_port
      row :disembark_port
      row :discount_percentage
      row :overview_tile
      row :passenger_capacity
      row :physical_rating
      row :includes_flight
      row :destination_id
      row :region_id
      row :map do
        image_tag(voyage.map.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Voyage" do
      f.input :name
      f.input :overview
      f.input :start_date
      f.input :end_date
      f.input :embark_port
      f.input :disembark_port
      f.input :discount_percentage
      f.input :overview_tile
      f.input :passenger_capacity
      f.input :physical_rating
      f.input :includes_flight
      f.input :destination_id
      f.input :region_id
      f.input :map, hint: f.voyage.map? ? image_tag(f.activity.map.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
