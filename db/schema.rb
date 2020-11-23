# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_23_150518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "value"
    t.string "user"
    t.decimal "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "api", default: false
  end

  create_table "rooms", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "players"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user"
    t.string "playersname"
    t.boolean "refreshauto"
    t.boolean "bloqcartarepet"
    t.string "card"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_login", default: "2020-06-09 22:39:35"
  end

end
