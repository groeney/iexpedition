ActiveAdmin.register Highlight do

  permit_params :name, :overview, :label, :image
  filter :name
  filter :overview
  filter :label

  index do
    selectable_column
    column :name
    column :overview
    column :label
    column "Image", sortable: false do |highlight|
      link_to "<img src='#{highlight.image.url}' alt='highlight image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, highlight.image.url
    end
    actions
  end

  show do |highlight|
    attributes_table do
      row :name
      row :overview
      row :label
      row :image do
        image_tag(highlight.image.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Highlight" do
      f.input :name
      f.input :overview
      f.input :label
      f.input :image, hint: f.highlight.image? ? image_tag(f.highlight.image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
