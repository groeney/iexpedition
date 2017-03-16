class RenamePassengerPhoneToPhoneNumber < ActiveRecord::Migration[5.0]
  def change
    rename_column(:passengers, :phone, :phone_number)
  end
end
