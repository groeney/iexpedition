class CreateEmergencyContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :relationship
      t.timestamps
    end
  end
end
