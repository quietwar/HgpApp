class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.text :data
      t.string :session_id
     end
    # t.index  :sessions,         unique: true
  end
end
