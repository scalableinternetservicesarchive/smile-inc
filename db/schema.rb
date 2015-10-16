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

ActiveRecord::Schema.define(version: 20151014011738) do

  create_table "mood_updates", force: :cascade do |t|
    t.integer  "mood_id"
    t.string   "desc"
    t.integer  "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mood_updates", ["mood_id"], name: "index_mood_updates_on_mood_id"

  create_table "moods", force: :cascade do |t|
    t.string   "color"
    t.string   "mood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end