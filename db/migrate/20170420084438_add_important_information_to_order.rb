class AddImportantInformationToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :important_information, :text
  end
end
