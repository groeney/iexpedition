class DropOperatorColumnFromShip < ActiveRecord::Migration[5.0]
  def up
    remove_column :ships, :operator_name
  end

  def down
    add_column :ships, :operator_name, :string
  end
end
