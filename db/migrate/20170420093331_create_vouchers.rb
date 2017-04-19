class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.belongs_to :order
      t.attachment :document
      t.string :link_name

      t.timestamps
    end
  end
end
