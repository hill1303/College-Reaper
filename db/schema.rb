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

ActiveRecord::Schema.define(version: 20140724203209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "hstore"

  create_table "colleges", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colleges", ["name"], :name => "index_colleges_on_name", :unique => true

  create_table "completions", force: true do |t|
    t.text    "grade",     default: "W", null: false
    t.integer "user_id"
    t.integer "course_id"
  end

  create_table "course_groups", force: true do |t|
    t.text    "name",                default: "",    null: false
    t.boolean "college_global",      default: false, null: false
    t.boolean "college_independent", default: false, null: false
    t.integer "college_id"
  end

  add_index "course_groups", ["name"], :name => "index_course_groups_on_name", :unique => true

  create_table "courses", force: true do |t|
    t.text     "instructional_unit"
    t.text     "course_number"
    t.text     "name"
    t.text     "credit_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "terms_id"
    t.integer  "section_id"
  end

  create_table "courses_requirement_groups", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "requirement_group_id"
  end

  create_table "courses_terms", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "term_id"
  end

  create_table "locations", force: true do |t|
    t.text     "name"
    t.spatial  "latlong",    limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.text     "street1"
    t.text     "street2"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section_id"
  end

  add_index "locations", ["latlong"], :name => "index_locations_on_latlong", :spatial => true

  create_table "people", force: true do |t|
    t.text     "name",       default: "",           null: false
    t.date     "dob",        default: '2014-01-01', null: false
    t.text     "sex",        default: "N",          null: false
    t.text     "gender"
    t.text     "pronoun",    default: "their",      null: false
    t.text     "title"
    t.text     "suffix"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences", force: true do |t|
    t.hstore   "choices"
    t.integer  "schedule_id"
    t.integer  "term_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requirement_groups", force: true do |t|
    t.text    "name",       default: "", null: false
    t.text    "rule",       default: "", null: false
    t.integer "owner_id"
    t.string  "owner_type"
  end

  create_table "schedules", force: true do |t|
    t.integer  "score"
    t.hstore   "sub_scores"
    t.integer  "user_id"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules_sections", id: false, force: true do |t|
    t.integer "schedule_id"
    t.integer "section_id"
  end

  create_table "sections", force: true do |t|
    t.string   "room",         default: "",                    null: false
    t.time     "start_time",   default: '2000-01-01 10:00:00', null: false
    t.time     "end_time",     default: '2000-01-01 11:00:00', null: false
    t.string   "rpt_pattern",  default: "",                    null: false
    t.boolean  "open",         default: false,                 null: false
    t.integer  "course_seats", default: 0,                     null: false
    t.integer  "wait_seats",   default: 0,                     null: false
    t.integer  "seat_max",     default: 0,                     null: false
    t.integer  "wait_max",     default: 0,                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "person_id"
    t.integer  "location_id"
    t.integer  "term_id"
  end

  create_table "terms", force: true do |t|
    t.string   "name",       default: "",           null: false
    t.date     "start_date", default: '2014-01-10', null: false
    t.date     "end_date",   default: '2014-04-30', null: false
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

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["uuid"], :name => "index_users_on_uuid", :unique => true

end
