class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.text :overview
      t.references :destination
      t.timestamps
    end
  end
end
