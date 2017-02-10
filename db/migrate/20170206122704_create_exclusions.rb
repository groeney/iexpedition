class CreateExclusions < ActiveRecord::Migration[5.0]
  def change
    create_table :exclusions do |t|
      t.string :name

      t.timestamps
    end
  end
end
