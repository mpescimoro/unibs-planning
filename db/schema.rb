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

ActiveRecord::Schema.define(version: 20141003081259) do

  create_table "colors", force: true do |t|
    t.string   "hex"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "year"
    t.boolean  "semester"
    t.integer  "degree_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "degree_id"
  end

  create_table "degrees", force: true do |t|
    t.string   "name"
    t.string   "area"
    t.boolean  "master"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "human_name"
    t.string   "short_name"
  end

  create_table "lessons", force: true do |t|
    t.integer  "course_id"
    t.integer  "hour"
    t.integer  "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "first"
    t.boolean  "last"
  end

  create_table "room_lessons", force: true do |t|
    t.integer  "room_id"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_plan_courses", force: true do |t|
    t.integer  "study_plan_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "color_id"
    t.string   "short_name"
  end

  create_table "study_plans", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_courses", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.integer  "degree_id"
    t.integer  "degree_year"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "study_plan_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
