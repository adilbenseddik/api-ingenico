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

ActiveRecord::Schema.define(version: 20151106232308) do

  create_table "tickets", force: :cascade do |t|
    t.string   "aid"
    t.datetime "date"
    t.string   "trader_name"
    t.string   "trader_address"
    t.string   "client_name"
    t.string   "authorization_number"
    t.string   "type_of_card"
    t.string   "tvr"
    t.float    "vat"
    t.float    "amount"
  end

end
