class AddIndexes < ActiveRecord::Migration
  def change
    add_index :users, :uid,       unique: true
    add_index :users, :steam_url, unique: true
  end
end
