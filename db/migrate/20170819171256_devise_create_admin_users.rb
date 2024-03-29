class DeviseCreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      ## Database authenticatable
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.datetime :remember_created_at


      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :email2
      t.bigint :cell
      t.string :provider
      t.string :uid
      #t.string :username
      t.integer :utf8
      t.string :login
      t.string :city
      t.integer :role, limit: 2, default: 0, null: false
      t.string :reset_password_token



      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.datetime :reset_password_sent_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end
    add_index :admin_users, :uid,             unique: true
    add_index :admin_users, :provider,             unique: true
    add_index :admin_users, :email,                unique: true
    add_index :admin_users, :reset_password_token, unique: true
    add_index :admin_users, :confirmation_token,   unique: true

  end
end
