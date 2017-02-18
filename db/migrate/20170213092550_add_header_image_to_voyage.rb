class AddHeaderImageToVoyage < ActiveRecord::Migration[5.0]
  def up
    add_attachment :voyages, :header_image
  end

  def down
    remove_attachment :voyages, :header_image
  end
end
