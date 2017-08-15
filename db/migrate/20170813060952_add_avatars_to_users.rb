class AddAvatarsToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.attachment :avatar
    end
  end

  def change
    change_table :admins do |t|
      t.attachment :avatar
  end
end
end
