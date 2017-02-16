class AddIsMandatoryToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :is_mandatory, :boolean, default: false
  end
end
