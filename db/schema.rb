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

ActiveRecord::Schema.define(version: 20140718220751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "hstore"

  create_table "colleges", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colleges", ["name"], name: "index_colleges_on_name", unique: true, using: :btree

  create_table "course_groups", force: true do |t|
    t.text    "name"
    t.boolean "college_global"
    t.boolean "college_independent"
  end

  create_table "courses_terms", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "term_id"
  end

  create_table "people", force: true do |t|
    t.text     "name"
    t.date     "dob"
    t.text     "sex"
    t.text     "gender"
    t.text     "pronoun"
    t.text     "title"
    t.text     "suffix"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "room"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "rpt_pattern"
    t.boolean  "open"
    t.integer  "course_seats"
    t.integer  "wait_seats"
    t.integer  "seat_max"
    t.integer  "wait_max"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "person_id"
    t.integer  "location_id"
  end

  create_table "spatial_ref_sys", id: false, force: true do |t|
    t.integer "srid",                   null: false
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "terms", force: true do |t|
    t.string   "name",       null: false
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.text     "uuid",                   default: "", null: false
    t.integer  "rank"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree

end
