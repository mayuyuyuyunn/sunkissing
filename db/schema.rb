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

ActiveRecord::Schema[7.0].define(version: 2022_12_28_053105) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sunscreen_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "sunscreen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sunscreen_id"], name: "index_sunscreen_tags_on_sunscreen_id"
    t.index ["tag_id", "sunscreen_id"], name: "index_sunscreen_tags_on_tag_id_and_sunscreen_id", unique: true
    t.index ["tag_id"], name: "index_sunscreen_tags_on_tag_id"
  end

  create_table "sunscreens", force: :cascade do |t|
    t.text "name", null: false
    t.string "manufacture", null: false
    t.integer "price", null: false
    t.integer "spf", default: 0, null: false
    t.integer "pa", default: 0, null: false
    t.text "summary", null: false
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand", null: false
    t.index ["name"], name: "index_sunscreens_on_name", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  add_foreign_key "sunscreen_tags", "sunscreens"
  add_foreign_key "sunscreen_tags", "tags"
end
