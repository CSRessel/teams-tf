class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body,       null:false  # comments
      t.integer :user_id,   null:false  # creator
      t.integer :player_id, null:false  # subject of review

      t.timestamps
    end
  end
end
