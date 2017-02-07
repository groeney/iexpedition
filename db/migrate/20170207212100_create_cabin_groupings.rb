class CreateCabinGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :cabin_groupings do |t|
      t.references :voyage
      t.references :cabin

      t.timestamps
    end
  end
end
