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

ActiveRecord::Schema.define(version: 20180112192001) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "kind"
    t.integer  "balance",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holder_accounts", force: true do |t|
    t.integer  "holder_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holders", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "transactions", force: true do |t|
    t.string   "kind"
    t.integer  "amount"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "holder_id"
    t.integer  "account_id"
  end

end
