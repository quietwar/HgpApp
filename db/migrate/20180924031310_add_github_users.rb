class AddGithubUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :url, :string
    add_column :projects, :github, :string
  end
end
