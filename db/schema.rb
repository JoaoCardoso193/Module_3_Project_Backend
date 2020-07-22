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

ActiveRecord::Schema.define(version: 2020_07_21_195707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.string "target"
    t.string "stat"
    t.float "value"
    t.float "cost"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.string "image_url"
    t.float "health"
    t.float "speed"
    t.float "attack"
    t.float "defense"
    t.float "battery_life"
  end

  create_table "robot_moves", force: :cascade do |t|
    t.integer "robot_id"
    t.integer "move_id"
  end

  create_table "robot_parts", force: :cascade do |t|
    t.integer "robot_id"
    t.integer "part_id"
  end

  create_table "robots", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.float "health"
    t.float "speed"
    t.float "attack"
    t.float "defense"
    t.float "battery_life"
  end

  create_table "user_robots", force: :cascade do |t|
    t.integer "user_id"
    t.integer "robot_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
  end

end
