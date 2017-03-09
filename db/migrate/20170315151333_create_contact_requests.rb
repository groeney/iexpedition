class CreateContactRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :destination
      t.datetime :travel_date
      t.integer :number_of_people
      t.text :message

      t.timestamps
    end
  end
end
