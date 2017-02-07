class AddAttachmentMapToVoyages < ActiveRecord::Migration
  def up
    add_attachment :voyages, :map
  end

  def down
    remove_attachment :voyages, :map
  end
end
