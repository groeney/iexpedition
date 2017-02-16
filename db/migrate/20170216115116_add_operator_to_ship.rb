class AddOperatorToShip < ActiveRecord::Migration[5.0]
  def change
    add_reference :ships, :operator, foreign_key: true
  end
end
