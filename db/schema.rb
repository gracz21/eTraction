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

ActiveRecord::Schema.define(version: 20170715170534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cameras", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_id"
    t.integer  "ride_id"
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "genre"
    t.integer  "length"
    t.string   "poster"
    t.string   "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_menu_items", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.float    "weight"
  end

  create_table "rides", force: :cascade do |t|
    t.integer  "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statements", force: :cascade do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ride_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  create_table "track_items", force: :cascade do |t|
    t.integer  "stop_id"
    t.integer  "track_id"
    t.integer  "position"
    t.integer  "travel_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "down_time"
    t.index ["stop_id"], name: "index_track_items_on_stop_id", using: :btree
    t.index ["track_id", "stop_id"], name: "index_track_items_on_track_id_and_stop_id", unique: true, using: :btree
    t.index ["track_id"], name: "index_track_items_on_track_id", using: :btree
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_videos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ride_id"
    t.string   "video"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "device_id"
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_users_on_device_id", unique: true, using: :btree
  end

end
