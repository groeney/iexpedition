class AddFieldsToCabin < ActiveRecord::Migration[5.0]
  def change
    add_column :cabins, :square_meter, :integer
    add_column :cabins, :overview, :text
  end
end
