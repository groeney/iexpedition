class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.text :overview
      t.attachment :image
      t.text :label

      t.timestamps
    end
  end
end
