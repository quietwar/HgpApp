# frozen_string_literal: true

class AddDeviseToAdminUsers < ActiveRecord::Migration[5.2]
  def change

    # add_index :admin_users, :confirmation_token,   unique: true
    # add_index :admin_users, :unlock_token,         unique: true
  end
 
end
