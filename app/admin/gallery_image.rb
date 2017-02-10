ActiveAdmin.register GalleryImage do

  permit_params :image, :description
  filter :description

  index do
    selectable_column
    column :description
    column "Image", sortable: false do |gallery_image|
      link_to "<img src='#{gallery_image.image.url}' alt='gallery_image image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, gallery_image.image.url
    end
    actions
  end

  show do |gallery_image|
    attributes_table do
      row :description
      row :image do
        image_tag(gallery_image.image.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Gallery Image" do
      f.input :image, hint: f.gallery_image.image? ? image_tag(f.gallery_image.image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
      f.input :description
    end
    f.actions
  end
end
