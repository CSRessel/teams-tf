class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :game_type # 6v6 or highlander
      t.string :league    # UGC, ESEA, or ETF2L
      t.string :level     # UGC: iron, steel, silver, gold, platinum; ESEA: open, invite; ETF2L: div6, div5,... div1
      t.string :notes     # additional comments by creator
      t.integer :user_id  # steam user that created the ad

      # desired classes
      t.boolean :scout
      t.boolean :soldier
      t.boolean :pyro
      t.boolean :demoman
      t.boolean :heavy
      t.boolean :engineer
      t.boolean :medic
      t.boolean :sniper
      t.boolean :spy

      t.timestamps
    end
  end
end
