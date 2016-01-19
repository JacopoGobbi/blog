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

ActiveRecord::Schema.define(version: 20160119131348) do

  create_table "follow_relations", force: :cascade do |t|
    t.integer  "user_following_id", limit: 4
    t.integer  "user_followed_id",  limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "follow_relations", ["user_followed_id"], name: "index_follow_relations_on_user_followed_id", using: :btree
  add_index "follow_relations", ["user_following_id", "user_followed_id"], name: "index_follow_relations_on_user_following_id_and_user_followed_id", unique: true, using: :btree
  add_index "follow_relations", ["user_following_id"], name: "index_follow_relations_on_user_following_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "remember_token",  limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree

  add_foreign_key "posts", "users"
end
