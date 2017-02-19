class AddHeaderImageToVoyage < ActiveRecord::Migration[5.0]
  def change
    add_attachment :voyages, :header_image
  end
end
