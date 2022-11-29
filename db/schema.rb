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

ActiveRecord::Schema[7.0].define(version: 2022_11_28_141613) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentors", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "mentor_id", null: false
    t.index ["mentor_id"], name: "index_reservations_on_mentor_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mentor_id", null: false
    t.index ["mentor_id"], name: "index_skills_on_mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "reservations", "mentors"
  add_foreign_key "reservations", "users"
  add_foreign_key "skills", "mentors"
end
