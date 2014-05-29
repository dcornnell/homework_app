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

ActiveRecord::Schema.define(version: 20140529152105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.string  "name"
    t.date    "due_date"
    t.integer "cohort_id"
    t.string  "description"
  end

  create_table "cohorts", force: true do |t|
    t.date    "start_date"
    t.integer "location_id"
    t.integer "course_id"
  end

  create_table "comments", force: true do |t|
    t.integer "user_id"
    t.string  "description"
    t.integer "commentable_id"
    t.string  "commentable_type"
  end

  create_table "courses", force: true do |t|
    t.string "title"
    t.string "description"
  end

  create_table "enrollments", force: true do |t|
    t.integer "user_id"
    t.integer "cohort_id"
  end

  create_table "homeworks", force: true do |t|
    t.string  "title"
    t.integer "user_id"
    t.integer "homework_id"
    t.string  "github_link"
    t.string  "heroku_link"
    t.string  "notes"
  end

  create_table "locations", force: true do |t|
    t.string "name"
    t.string "address"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

end
