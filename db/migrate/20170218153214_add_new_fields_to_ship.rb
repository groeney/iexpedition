class AddNewFieldsToShip < ActiveRecord::Migration[5.0]
  def change
    add_column :ships, :stabilisers, :integer
    add_column :ships, :draft, :integer
    add_column :ships, :overview_tile, :text
    remove_column :ships, :currency, :string

    reversible do |dir|
      change_table :ships do |t|
        dir.up { t.change_default :open_bridge, nil }
        dir.up  { t.change :open_bridge, 'integer USING CAST(open_bridge AS integer)' }

        dir.down  { t.change :open_bridge, :string }
      end
    end
  end
end
