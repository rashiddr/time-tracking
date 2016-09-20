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

ActiveRecord::Schema.define(version: 20160920044822) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "daily_status_id"
    t.integer  "user_id"
    t.text     "comments",        limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "daily_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.date     "status_date"
    t.integer  "project_id"
    t.integer  "duration"
    t.text     "work_done",   limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "checked",                   default: false
    t.index ["project_id"], name: "index_daily_statuses_on_project_id", using: :btree
    t.index ["user_id"], name: "index_daily_statuses_on_user_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "priority",                 default: 0, null: false
    t.integer  "attempts",                 default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "client"
    t.text     "description",     limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "project_name"
    t.integer  "project_manager"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_projects_on_deleted_at", using: :btree
    t.index ["project_manager"], name: "index_projects_on_project_manager", using: :btree
  end

  create_table "trainings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "trainer"
    t.datetime "training_datetime"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "location"
    t.float    "duration",          limit: 24
  end

  create_table "user_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id", using: :btree
    t.index ["user_id"], name: "index_user_projects_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
    t.string   "place"
    t.date     "dob"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "username"
    t.string   "user_pic_file_name"
    t.string   "user_pic_content_type"
    t.integer  "user_pic_file_size"
    t.datetime "user_pic_updated_at"
    t.date     "join_date"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["first_name", "last_name"], name: "index_users_on_first_name_and_last_name", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
