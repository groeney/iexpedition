class AddImageToVoyage < ActiveRecord::Migration[5.0]
  def up
    add_attachment :voyages, :image
  end

  def down
    remove_attachment :voyages, :image
  end
end
