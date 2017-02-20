ActiveAdmin.register Ship do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :category, :payment_prior, :recommendation_text,
                :passenger_capacity, :luxury_star_rating, :crew_number,
                :ice_class, :speed, :year_refurbished, :year_built, :length,
                :width, :tonnage, :registry, :engines, :outlets, :open_bridge,
                :observation_decks, :zodiacs, :provided_gear, :polar_code_compliant,
                :stabilisers, :draft, :overview_tile, :ix_review, :did_you_know,
                :header_image

  index do
    selectable_column
    column :name
    column :operator_name
    column :category
    column :currency
    column :payment_prior
    actions
  end

  show do |ship|
    attributes_table do
      row :name
      row :category
      row :payment_prior
      row :recommendation_text
      row :passenger_capacity
      row :luxury_star_rating
      row :crew_number
      row :ice_class
      row :speed
      row :year_refurbished, as: :datetime_picker
      row :year_built, as: :datetime_picker
      row :length
      row :width
      row :tonnage
      row :registry
      row :engines
      row :outlets
      row :open_bridge
      row :observation_decks
      row :zodiacs
      row :provided_gear
      row :polar_code_compliant
      row :stabilisers
      row :draft
      row :overview_tile
      row :ix_review
      row :did_you_know
      row :header_image do
        image_tag(ship.header_image.url(:thumb))
      end
      row :map do
        image_tag(ship.map.url(:thumb))
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Ship" do
      f.input :name
      f.input :category
      f.input :payment_prior
      f.input :recommendation_text
      f.input :passenger_capacity
      f.input :luxury_star_rating
      f.input :crew_number
      f.input :ice_class
      f.input :speed
      f.input :year_refurbished, start_year: 1960
      f.input :year_built, start_year: 1920
      f.input :length
      f.input :width
      f.input :tonnage
      f.input :registry
      f.input :engines
      f.input :outlets
      f.input :open_bridge
      f.input :observation_decks
      f.input :zodiacs
      f.input :provided_gear
      f.input :polar_code_compliant
      f.input :stabilisers
      f.input :draft
      f.input :overview_tile
      f.input :ix_review
      f.input :did_you_know
      f.input :header_image, hint: f.ship.header_image? ? image_tag(f.ship.header_image.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")

      f.input :map, hint: f.ship.map? ? image_tag(f.ship.map.url, height: "100") : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
