ActiveAdmin.register Fact do

  permit_params :question, :answer, :more_info, :image, :destination_id
  filter :question
  filter :answer
  filter :destination

  index do
    selectable_column
    column :question
    column :answer
    column :destination
    column "Image", sortable: false do |fact|
      link_to "<img src='#{fact.image.url}' alt='fact image' style='height:48px;display:block;margin-left:auto;margin-right:auto;'".html_safe, fact.image.url
    end
    actions
  end

  show do |fact|
    attributes_table do
      row :question
      row :answer
      row :destination
      row :image do
        image_tag(fact.image.url)
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Fact" do
      f.input :question
      f.input :answer
      f.input :destination
      f.input :image, hint: f.fact.image? ? image_tag(f.fact.image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
