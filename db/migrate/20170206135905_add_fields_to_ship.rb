class AddFieldsToShip < ActiveRecord::Migration[5.0]
  def change
    add_column :ships, :recommendation_text, :text
    add_column :ships, :passenger_capacity, :integer
    add_column :ships, :luxury_star_rating, :integer
    add_column :ships, :crew_number, :integer
    add_column :ships, :ice_class, :string
    add_column :ships, :speed, :integer
    add_column :ships, :year_refurbished, :date
    add_column :ships, :year_built, :date
    add_column :ships, :length, :integer
    add_column :ships, :width, :integer
    add_column :ships, :tonnage, :integer
    add_column :ships, :registry, :integer
    add_column :ships, :engines, :integer
    add_column :ships, :outlets, :integer
  end
end
