class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid,      null:false  # steam uid
      t.string :nick,     null:false  # steam nickname
      t.string :profile,  null:false  # profile url
      t.string :avatar,   null:false  # avatar url
      t.string :location              # country code?
      t.string :timezone              # possibly vestigial variable for preferred timezone

      t.timestamps
    end
  end
end
