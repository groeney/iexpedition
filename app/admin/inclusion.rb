ActiveAdmin.register Inclusion do

  permit_params :name, :overview, :image
  filter :name

  index do
    selectable_column
    column :name
    column :overview
    column "Image", sortable: false do |inclusion|
      link_to "<img src='#{inclusion.image.url}' alt='inclusion image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, inclusion.image.url
    end
    actions
  end

  show do |inclusion|
    attributes_table do
      row :name
      row :overview
      row :image do
        image_tag(inclusion.image.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Inclusion" do
      f.input :name
      f.input :overview
      f.input :image, hint: f.inclusion.image? ? image_tag(f.inclusion.image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
