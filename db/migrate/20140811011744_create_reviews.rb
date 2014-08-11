class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body        # comments
      t.integer :user_id    # creator
      t.integer :player_id  # subject of review

      t.timestamps
    end
  end
end
