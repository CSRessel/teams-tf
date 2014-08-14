class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name,         null:false  # team name
      t.string :tag                       # team tag
      t.string :game_type,    null:false  # 6v6 or Highlander
      t.string :league_level, null:false  # UGC: iron, steel, silver, gold, platinum; ESEA: open, invite; ETF2L: div6, div5,... div1
      t.string :notes                     # additional comments by creator
      t.string :location,     null:false  # NA or EU
      t.integer :user_id,     null:false  # steam user that created the ad

      # desired classes
      t.boolean :scout,     default:false
      t.boolean :soldier,   default:false
      t.boolean :pyro,      default:false
      t.boolean :demoman,   default:false
      t.boolean :heavy,     default:false
      t.boolean :engineer,  default:false
      t.boolean :medic,     default:false
      t.boolean :sniper,    default:false
      t.boolean :spy,       default:false

      t.timestamps
    end
  end
end
