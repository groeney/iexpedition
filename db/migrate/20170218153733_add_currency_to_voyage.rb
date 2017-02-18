class AddCurrencyToVoyage < ActiveRecord::Migration[5.0]
  def change
    add_column :voyages, :currency, :string, default: 'USD'
  end
end
