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

ActiveRecord::Schema.define(version: 20150311224806) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["step_id"], name: "index_comments_on_step_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "priorities", force: true do |t|
    t.integer  "urgency"
    t.string   "color"
    t.integer  "todo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "priorities", ["todo_id"], name: "index_priorities_on_todo_id"

  create_table "steps", force: true do |t|
    t.boolean  "completed"
    t.datetime "completed_at"
    t.integer  "order_number"
    t.datetime "deadline"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "todo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["todo_id"], name: "index_steps_on_todo_id"
  add_index "steps", ["user_id"], name: "index_steps_on_user_id"

  create_table "todos", force: true do |t|
    t.boolean  "completed"
    t.datetime "completed_at"
    t.string   "title"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "todos", ["user_id"], name: "index_todos_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
