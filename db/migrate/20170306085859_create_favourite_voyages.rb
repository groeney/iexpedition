class CreateFavouriteVoyages < ActiveRecord::Migration[5.0]
  def change
    create_table :favourite_voyages do |t|
      t.references :voyage, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
