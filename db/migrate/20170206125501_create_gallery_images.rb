class CreateGalleryImages < ActiveRecord::Migration[5.0]
  def change
    create_table :gallery_images do |t|
      t.attachment :image
      t.text :description

      t.timestamps
    end
  end
end
