# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140811011744) do

  create_table "players", force: true do |t|
    t.string   "game_type",                  null: false
    t.string   "league",                     null: false
    t.string   "level",                      null: false
    t.string   "notes"
    t.integer  "user_id",                    null: false
    t.boolean  "scout",      default: false
    t.boolean  "soldier",    default: false
    t.boolean  "pyro",       default: false
    t.boolean  "demoman",    default: false
    t.boolean  "heavy",      default: false
    t.boolean  "engineer",   default: false
    t.boolean  "medic",      default: false
    t.boolean  "sniper",     default: false
    t.boolean  "spy",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "player_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",                       null: false
    t.string   "tag"
    t.string   "game_type",                  null: false
    t.string   "league",                     null: false
    t.string   "level",                      null: false
    t.string   "notes"
    t.integer  "user_id",                    null: false
    t.boolean  "scout",      default: false
    t.boolean  "soldier",    default: false
    t.boolean  "pyro",       default: false
    t.boolean  "demoman",    default: false
    t.boolean  "heavy",      default: false
    t.boolean  "engineer",   default: false
    t.boolean  "medic",      default: false
    t.boolean  "sniper",     default: false
    t.boolean  "spy",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nick",       null: false
    t.string   "profile",    null: false
    t.string   "avatar",     null: false
    t.string   "location"
    t.string   "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
