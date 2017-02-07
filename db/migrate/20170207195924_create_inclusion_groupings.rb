class CreateInclusionGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :inclusion_groupings do |t|
      t.references :voyage
      t.references :inclusion

      t.timestamps
    end
  end
end
