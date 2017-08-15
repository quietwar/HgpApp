class RenameTableTables < ActiveRecord::Migration[5.0]
  def change
    rename_table :table_chatrooms, :features
  end
end
