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

ActiveRecord::Schema.define(version: 2021_01_31_002331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "email"
    t.string "manager_name"
    t.string "abn"
    t.string "website"
    t.string "contact_number"
    t.string "address"
    t.string "suburb"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "user_name"
    t.string "driver_license_number"
    t.date "driver_license_expiry"
    t.bigint "company_id", null: false
    t.string "driver_id"
    t.boolean "is_admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "fleet_id"
    t.string "make"
    t.string "model"
    t.string "year"
    t.string "color"
    t.string "rego"
    t.date "rego_expiry_date"
    t.decimal "rego_fee"
    t.string "insurance_provider"
    t.string "insurance_police_number"
    t.date "insurance_expiry_date"
    t.decimal "insurance_fee"
    t.decimal "maintenance_fee"
    t.boolean "is_selected", default: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_vehicles_on_company_id"
  end

  add_foreign_key "users", "companies"
  add_foreign_key "vehicles", "companies"
end
