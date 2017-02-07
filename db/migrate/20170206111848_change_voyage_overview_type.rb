class ChangeVoyageOverviewType < ActiveRecord::Migration[5.0]
  def up
    change_column :voyages, :overview, :text
  end

  def down
    change_column :voyages, :overview, :string
  end
end
