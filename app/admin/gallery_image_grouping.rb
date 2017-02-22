ActiveAdmin.register GalleryImageGrouping do

  permit_params :gallery_image_id, :gallery_imageable_type, :gallery_imageable_id
  filter :gallery_imageable, collection: GalleryImage.gallery_imageables.map { |gallery_imageable| [gallery_imageable.identifier_s, gallery_imageable.id] }
  filter :gallery_imageable_type, collection: ["Ship", "Voyage"]
  filter :gallery_image

  index do
    selectable_column
    column :gallery_imageable_type
    column :gallery_imageable
    column "Gallery Image", sortable: false do |gig|
      link_to "<img src='#{gig.gallery_image.image.url}' alt='gig.gallery_image image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, gig.gallery_image.image.url
    end
    column "Description" do |gig|
      gig.gallery_image.description
    end
    actions
  end

  show do |gig|
    attributes_table do
      row :gallery_image do
        image_tag(gig.gallery_image.image.url)
      end
      row "Description" do
        gig.gallery_image.description
      end
      row :gallery_imageable_type
      row :gallery_imageable
    end
  end

  form do |f|
    f.inputs "Gallery Image Grouping Details" do
      f.input :gallery_image, as: :select, collection: GalleryImage.all.map { |gi| [gi.description, gi.id]  }
      f.input :gallery_imageable_type, as: :select, collection: ["Ship", "Voyage"]
      f.input :gallery_imageable_id, as: :select, collection: GalleryImage.gallery_imageables.map { |gallery_imageable| [gallery_imageable.identifier_s, gallery_imageable.id] }
    end
    f.actions
  end

end
