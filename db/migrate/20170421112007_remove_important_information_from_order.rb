class RemoveImportantInformationFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :important_information
  end
end
