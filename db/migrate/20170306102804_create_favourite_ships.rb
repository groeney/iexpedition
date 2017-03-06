class CreateFavouriteShips < ActiveRecord::Migration[5.0]
  def change
    create_table :favourite_ships do |t|
      t.references :user, foreign_key: true
      t.references :ship, foreign_key: true

      t.timestamps
    end
  end
end
