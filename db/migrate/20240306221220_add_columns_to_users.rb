class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :linkedin, :string
    add_column :users, :instagram, :string
    add_column :users, :tiktok, :string
  end
end
