class CreateFavouriteShips < ActiveRecord::Migration[5.0]
  def change
    create_table :favourite_ships do |t|
      t.references :user
      t.references :ship

      t.timestamps
    end
  end
end
