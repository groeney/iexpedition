ActiveAdmin.register Cabin do

  permit_params :name, :price, :single_supplement, :description, :square_meter, :overview, :image
  filter :name
  filter :price
  filter :single_supplement
  filter :overview

  index do
    selectable_column
    column :id
    column :name
    column :price
    column :single_supplement
    column "Image", sortable: false do |cabin|
      link_to "<img src='#{cabin.image.url}' alt='cabin image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, cabin.image.url
    end
    actions
  end

  show do |cabin|
    attributes_table do
      row :id
      row :name
      row :price
      row :single_supplement
      row :description
      row :square_meter
      row :overview
      row :image do
        image_tag(cabin.image.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Cabin" do
      f.input :name
      f.input :price
      f.input :single_supplement
      f.input :description
      f.input :square_meter
      f.input :overview
      f.input :image, hint: f.cabin.image? ? image_tag(f.cabin.image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
