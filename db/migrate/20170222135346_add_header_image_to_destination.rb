class AddHeaderImageToDestination < ActiveRecord::Migration[5.0]
  def change
    add_attachment :destinations, :header_image
  end
end
