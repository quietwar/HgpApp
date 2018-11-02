class AddtoTable < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string  :app_name
      t.string  :coding
      t.text    :project_details
      t.date    :start_date
      t.integer  :user_id
      t.integer :utf8
      t.string  :authenticity_token
      t.string  :commit
      t.string  :locale
      t.string  :url
      t.string  :github
      t.datetime :created_at,      null: false
      t.datetime  :updated_at,      null: false

   end
  #add_index :project, :user_id,      unique: true
  end
end
