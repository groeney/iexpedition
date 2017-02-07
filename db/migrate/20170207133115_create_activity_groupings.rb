class CreateActivityGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_groupings do |t|
      t.references :voyage
      t.references :activity
      t.float :price

      t.timestamps
    end
  end
end
