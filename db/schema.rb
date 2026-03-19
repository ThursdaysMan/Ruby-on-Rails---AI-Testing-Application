# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_03_18_162658) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "map_map_tiles", force: :cascade do |t|
    t.bigint "map_id", null: false
    t.bigint "map_tile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_map_map_tiles_on_map_id"
    t.index ["map_tile_id"], name: "index_map_map_tiles_on_map_tile_id"
  end

  create_table "map_tiles", force: :cascade do |t|
    t.string "name"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_maps_on_user_id"
  end

  create_table "user_layers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "geojson_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "map_id", null: false
    t.index ["map_id"], name: "index_user_layers_on_map_id"
    t.index ["user_id"], name: "index_user_layers_on_user_id"
  end

  create_table "user_map_tiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "map_tile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_tile_id"], name: "index_user_map_tiles_on_map_tile_id"
    t.index ["user_id"], name: "index_user_map_tiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "map_map_tiles", "map_tiles"
  add_foreign_key "map_map_tiles", "maps"
  add_foreign_key "maps", "users"
  add_foreign_key "user_layers", "maps"
  add_foreign_key "user_layers", "users"
  add_foreign_key "user_map_tiles", "map_tiles"
  add_foreign_key "user_map_tiles", "users"
end
