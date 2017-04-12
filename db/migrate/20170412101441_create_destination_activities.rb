class CreateDestinationActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :destination_activities do |t|
      t.references :destination, foreign_key: true
      t.string :name, null: false
      t.text :overview
      t.attachment :image
      t.text :label

      t.timestamps
    end
  end
end
