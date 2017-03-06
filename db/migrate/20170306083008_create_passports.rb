class CreatePassports < ActiveRecord::Migration[5.0]
  def change
    create_table :passports do |t|
      t.references :user, foreign_key: true
      t.string :number
      t.date :issue_date
      t.date :expiry_date
      t.string :place_of_birth
      t.string :nationality
      t.attachment :image
      t.attachment :visa

      t.timestamps
    end
  end
end
