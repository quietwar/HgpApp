class CreateActiveAdminPermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :active_admin_permissions do |t|
      t.string t.integer "managed_resource_id", null: false
      t.integer "role", limit: 1, default: 0, null: false
      t.integer "state", limit: 1, default: 0, null: false
      t.index ["managed_resource_id", "role"], name: "active_admin_permissions_index", unique: true
    
    end
  end
end
