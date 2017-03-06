class ChangeDefaultUserSignupOptions < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up { t.change_default :email_newsletter, false }
        dir.up { t.change_default :accept_privacy_policy, false }

        dir.down { t.change_default :email_newsletter, nil }
        dir.down { t.change_default :accept_privacy_policy, nil }
      end
    end
  end
end
