class AddColumnsToDestination < ActiveRecord::Migration[5.0]
  def change
    add_attachment :ships, :map
    add_attachment :ships, :header_image
    add_column :ships, :did_you_know, :text
  end
end
