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

ActiveRecord::Schema.define(version: 20150707170413) do

  create_table "employees", force: :cascade do |t|
    t.text     "name"
    t.text     "username"
    t.text     "password_digest"
    t.integer  "employer_id"
    t.text     "auth"
    t.integer  "auth_expires_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "employers", force: :cascade do |t|
    t.text     "name"
    t.text     "company_name"
    t.text     "username"
    t.text     "password_digest"
    t.text     "auth"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer  "qr_code_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "properties", force: :cascade do |t|
    t.text     "location"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qr_codes", force: :cascade do |t|
    t.text     "location"
    t.text     "content"
    t.integer  "company_id"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text     "content"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
