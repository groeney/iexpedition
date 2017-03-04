class AddRegistrationOptionsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_newsletter, :boolean
    add_column :users, :accept_privacy_policy, :boolean
  end
end
