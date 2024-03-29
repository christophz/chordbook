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

ActiveRecord::Schema.define(version: 20161008192239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "musician"
    t.string   "originalkey"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "transcriber_id"
  end

  create_table "transcribers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.text     "instruments"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "bandcamp_link"
    t.string   "soundcloud_link"
  end

  add_index "transcribers", ["email"], name: "index_transcribers_on_email", unique: true, using: :btree
  add_index "transcribers", ["reset_password_token"], name: "index_transcribers_on_reset_password_token", unique: true, using: :btree

  create_table "transcriptions", force: :cascade do |t|
    t.integer "song_id"
    t.string  "level"
    t.string  "key"
    t.text    "lyrics"
    t.string  "video"
    t.text    "comment"
    t.integer "transcriber_id"
  end

  add_index "transcriptions", ["song_id"], name: "index_transcriptions_on_song_id", using: :btree

  add_foreign_key "transcriptions", "songs"
end
