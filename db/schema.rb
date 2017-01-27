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

ActiveRecord::Schema.define(version: 20170127191546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cups", force: :cascade do |t|
    t.string   "user_identifier", null: false
    t.string   "user_name",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "slack_identifier", default: "", null: false
    t.string   "name",             default: "", null: false
    t.string   "email",            default: "", null: false
    t.string   "first_name",       default: "", null: false
    t.string   "last_name",        default: "", null: false
    t.string   "real_name",        default: "", null: false
    t.string   "avatar_72",        default: "", null: false
    t.string   "avatar_192",       default: "", null: false
    t.jsonb    "raw",              default: {}, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
