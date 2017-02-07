class CreateGalleryImageGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :gallery_image_groupings do |t|
      t.integer :gallery_imageable_id
      t.string :gallery_imageable_type
      t.references :gallery_image, foreign_key: true

      t.timestamps
    end
  end
end
