class AddNotNullToActivitiesIsMandatory < ActiveRecord::Migration[5.0]
  def up
    change_column :activities, :is_mandatory, :boolean, null: false, default: false
  end

  def down
    change_column :activities, :is_mandatory, :boolean, null: true, default: false
  end
end
