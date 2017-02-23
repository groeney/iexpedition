class AddColumnsToDestination < ActiveRecord::Migration[5.0]
  def change
    add_attachment :ships, :map
    add_attachment :ships, :header_image
  end
end
