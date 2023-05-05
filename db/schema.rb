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

ActiveRecord::Schema[7.0].define(version: 2023_05_03_223927) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.float "kg"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "age"
    t.string "castrated"
    t.string "species"
    t.string "sex"
    t.string "breed"
    t.index ["client_id"], name: "index_animals_on_client_id"
  end

  create_table "budget_services", force: :cascade do |t|
    t.integer "budget_id"
    t.integer "service_value_id"
    t.float "discount"
    t.float "total_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "service_id"
    t.integer "user_id"
    t.float "total_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "payment_type"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "document_number"
    t.string "address"
    t.string "address_number"
    t.string "address_compl"
    t.string "neighborhood"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "service_values", force: :cascade do |t|
    t.string "name"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "animal_id", null: false
    t.string "petetion"
    t.string "process"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["animal_id"], name: "index_services_on_animal_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "is_completed", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "role"
  end

  add_foreign_key "animals", "clients"
  add_foreign_key "clients", "users"
  add_foreign_key "services", "animals"
  add_foreign_key "services", "users"
end
