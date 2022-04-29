# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_27_150239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "repositories", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "github_id"
    t.string "name", null: false
    t.string "node_id", null: false
    t.string "full_name", null: false
    t.string "html_url", null: false
    t.string "description"
    t.boolean "fork", default: false
    t.boolean "private", default: true
    t.string "url"
    t.string "git_url"
    t.string "ssh_url"
    t.string "language"
    t.string "clone_url"
    t.string "svn_url"
    t.string "forks_url"
    t.integer "size"
    t.integer "forks_count", default: 0
    t.datetime "pushed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["github_id"], name: "index_repositories_on_github_id"
    t.index ["user_id"], name: "index_repositories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.bigint "github_id", null: false
    t.string "url"
    t.string "name"
    t.string "email"
    t.string "avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

end
