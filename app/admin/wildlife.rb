ActiveAdmin.register Wildlife do
  permit_params :name, :overview, :label, :fact, :image
  filter :name
  filter :overview
  filter :label

  index do
    selectable_column
    column :name
    column :overview
    column :label
    column "Image", sortable: false do |wildlife|
      link_to "<img src='#{wildlife.image.url}' alt='wildlife image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, wildlife.image.url
    end
    actions
  end

  show do |wildlife|
    attributes_table do
      row :name
      row :overview
      row :label
      row :fact
      row :image do
        image_tag(wildlife.image.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Wildlife" do
      f.input :name
      f.input :overview
      f.input :label
      f.input :fact
      f.input :image, hint: f.wildlife.image? ? image_tag(f.wildlife.image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
