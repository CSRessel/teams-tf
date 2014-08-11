class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick      # steam nickname
      t.string :profile   # profile url
      t.string :avatar    # avatar url
      t.string :location  # country code?
      t.string :timezone  # possibly vestigial variable for preferred timezone

      t.timestamps
    end
  end
end
