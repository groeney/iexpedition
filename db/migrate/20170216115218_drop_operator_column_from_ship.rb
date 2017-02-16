class DropOperatorColumnFromShip < ActiveRecord::Migration[5.0]
  def change
    remove_column :ships, :operator_name
  end
end
