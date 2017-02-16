class ChangeShipOutletToString < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :ships do |t|
        dir.up  { t.change :outlets, :string }
        dir.up { t.change_default :outlets, nil }
        dir.down  { t.change :outlets, 'integer USING CAST(outlets AS integer)' }
      end
    end
  end
end
