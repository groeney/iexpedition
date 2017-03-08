class ChangeDobColumnType < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up { t.change :dob, :date }
        dir.down { t.change :dob, :datetime }
      end
    end
  end
end
