ActiveAdmin.register Activity do

  permit_params :name, :overview, :label, :price, :image
  filter :name
  filter :price
  filter :label

  index do
    selectable_column
    column :name
    column :overview
    column :label
    column :price
    column "Image", sortable: false do |activity|
      link_to "<img src='#{activity.image.url}' alt='activity image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, activity.image.url
    end
    actions
  end

  show do |activity|
    attributes_table do
      row :name
      row :overview
      row :label
      row :price
      row :image do
        image_tag(activity.image.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Activity" do
      f.input :name
      f.input :overview
      f.input :label
      f.input :price
      f.input :image, hint: f.activity.image? ? image_tag(f.activity.image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
