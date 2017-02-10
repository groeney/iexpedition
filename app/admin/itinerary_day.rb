ActiveAdmin.register ItineraryDay do

  permit_params :name, :overview, :image
  filter :name
  filter :overview

  index do
    selectable_column
    column :name
    column :overview
    column "Image", sortable: false do |itinerary_day|
      link_to "<img src='#{itinerary_day.image.url}' alt='itinerary_day image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, itinerary_day.image.url
    end
    actions
  end

  show do |itinerary_day|
    attributes_table do
      row :name
      row :overview
      row :image do
        image_tag(itinerary_day.image.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Itinerary day" do
      f.input :name
      f.input :overview
      f.input :image, hint: f.itinerary_day.image? ? image_tag(f.itinerary_day.image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
