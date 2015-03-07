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

ActiveRecord::Schema.define(version: 20150303022804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "authorization_code"
    t.string   "access_token"
    t.json     "links"
    t.string   "contact_name"
    t.string   "helper_access_pin"
    t.string   "given_name"
    t.string   "family_name"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "country"
    t.string   "preferred_language"
    t.string   "display_name"
    t.string   "person_id"
    t.string   "tree_user_id"
  end

end
