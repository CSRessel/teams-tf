class AddIndexs < ActiveRecord::Migration
  def change
    add_index :teams, :name,    unique: true
    add_index :users, :uid,     unique: true
    add_index :users, :profile, unique: true
  end
end
