class AddImageToRegion < ActiveRecord::Migration[5.0]
  def change
    add_attachment :regions, :image
  end
end
