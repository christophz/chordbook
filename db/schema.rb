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

ActiveRecord::Schema.define(version: 20161002194645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "musician"
    t.string   "originalkey"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "transcribers", force: :cascade do |t|
    t.string   "name"
    t.text     "instruments"
    t.string   "email"
    t.string   "facebook_link"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "transcriptions", force: :cascade do |t|
    t.integer "song_id"
    t.integer "transcriber_id"
    t.string  "level"
    t.string  "key"
    t.text    "lyrics"
    t.string  "video"
    t.text    "comment"
  end

  add_index "transcriptions", ["song_id"], name: "index_transcriptions_on_song_id", using: :btree
  add_index "transcriptions", ["transcriber_id"], name: "index_transcriptions_on_transcriber_id", using: :btree

  add_foreign_key "transcriptions", "songs"
  add_foreign_key "transcriptions", "transcribers"
end
