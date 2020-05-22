# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_22_153035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_profiles", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_admin_profiles_on_status"
    t.index ["user_id"], name: "index_admin_profiles_on_user_id"
  end

  create_table "application_settings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "auth_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_auth_blacklists_on_jti"
  end

  create_table "available_driver_shifts", force: :cascade do |t|
    t.time "from", null: false
    t.time "to", null: false
    t.integer "weekday", default: 0, null: false
    t.bigint "driver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_available_driver_shifts_on_driver_id"
    t.index ["weekday"], name: "index_available_driver_shifts_on_weekday"
  end

  create_table "bag_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "allergen"
    t.integer "dietary_restriction", default: 0, null: false
    t.bigint "pantry_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dietary_restriction"], name: "index_bag_types_on_dietary_restriction"
    t.index ["pantry_id"], name: "index_bag_types_on_pantry_id"
  end

  create_table "bags", force: :cascade do |t|
    t.string "description"
    t.string "allergen"
    t.integer "dietary_restriction", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.bigint "bag_type_id", null: false
    t.bigint "pantry_id", null: false
    t.integer "delivery_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bag_type_id"], name: "index_bags_on_bag_type_id"
    t.index ["delivery_id"], name: "index_bags_on_delivery_id"
    t.index ["dietary_restriction"], name: "index_bags_on_dietary_restriction"
    t.index ["pantry_id"], name: "index_bags_on_pantry_id"
    t.index ["status"], name: "index_bags_on_status"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "driver_id"
    t.bigint "driver_shift_id"
    t.bigint "household_id"
    t.bigint "pantry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_deliveries_on_driver_id"
    t.index ["driver_shift_id"], name: "index_deliveries_on_driver_shift_id"
    t.index ["household_id"], name: "index_deliveries_on_household_id"
    t.index ["pantry_id"], name: "index_deliveries_on_pantry_id"
    t.index ["status"], name: "index_deliveries_on_status"
  end

  create_table "delivery_windows", force: :cascade do |t|
    t.time "from", null: false
    t.time "to", null: false
    t.integer "weekday", default: 0, null: false
    t.bigint "household_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_delivery_windows_on_household_id"
    t.index ["weekday"], name: "index_delivery_windows_on_weekday"
  end

  create_table "dietary_restrictions", force: :cascade do |t|
    t.string "allergen"
    t.integer "restriction_type", default: 0, null: false
    t.integer "household_size", default: 0, null: false
    t.bigint "household_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_dietary_restrictions_on_household_id"
    t.index ["restriction_type"], name: "index_dietary_restrictions_on_restriction_type"
  end

  create_table "driver_shifts", force: :cascade do |t|
    t.date "date", null: false
    t.time "from", null: false
    t.time "to", null: false
    t.integer "status", default: 0, null: false
    t.bigint "driver_id", null: false
    t.bigint "pantry_shift_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_driver_shifts_on_driver_id"
    t.index ["pantry_shift_id"], name: "index_driver_shifts_on_pantry_shift_id"
    t.index ["status"], name: "index_driver_shifts_on_status"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "street"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.string "email", null: false
    t.integer "status", default: 0, null: false
    t.boolean "current", default: true, null: false
    t.bigint "user_id"
    t.bigint "pantry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pantry_id"], name: "index_drivers_on_pantry_id"
    t.index ["status"], name: "index_drivers_on_status"
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "eligibility_applications", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "street"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.integer "household_size", default: 0, null: false
    t.decimal "income", precision: 8, scale: 2
    t.date "expire_on"
    t.integer "status", default: 0, null: false
    t.bigint "household_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_eligibility_applications_on_household_id"
    t.index ["status"], name: "index_eligibility_applications_on_status"
  end

  create_table "households", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "street"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.string "email", null: false
    t.integer "size", default: 0, null: false
    t.decimal "income", precision: 8, scale: 2, default: "0.0", null: false
    t.boolean "accept_deliveries", default: true, null: false
    t.boolean "current", default: true, null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.integer "pantry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pantry_id"], name: "index_households_on_pantry_id"
    t.index ["status"], name: "index_households_on_status"
    t.index ["user_id"], name: "index_households_on_user_id"
  end

  create_table "pantries", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "website"
    t.string "street"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.string "email", null: false
    t.integer "max_daily_bags", default: 0, null: false
    t.boolean "current", default: true, null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_pantries_on_status"
    t.index ["user_id"], name: "index_pantries_on_user_id"
  end

  create_table "pantry_shifts", force: :cascade do |t|
    t.date "date", null: false
    t.time "from", null: false
    t.time "to", null: false
    t.integer "status", default: 0, null: false
    t.bigint "pantry_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pantry_id"], name: "index_pantry_shifts_on_pantry_id"
    t.index ["status"], name: "index_pantry_shifts_on_status"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "street"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.boolean "notify_via_email", default: true, null: false
    t.boolean "notify_via_text", default: false, null: false
    t.boolean "notify_via_app", default: false, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["status"], name: "index_users_on_status"
  end

  add_foreign_key "admin_profiles", "users"
  add_foreign_key "available_driver_shifts", "drivers"
  add_foreign_key "bag_types", "pantries"
  add_foreign_key "bags", "bag_types"
  add_foreign_key "bags", "pantries"
  add_foreign_key "deliveries", "driver_shifts"
  add_foreign_key "deliveries", "drivers"
  add_foreign_key "deliveries", "households"
  add_foreign_key "deliveries", "pantries"
  add_foreign_key "delivery_windows", "households"
  add_foreign_key "dietary_restrictions", "households"
  add_foreign_key "driver_shifts", "drivers"
  add_foreign_key "driver_shifts", "pantry_shifts"
  add_foreign_key "drivers", "pantries"
  add_foreign_key "drivers", "users"
  add_foreign_key "eligibility_applications", "households"
  add_foreign_key "households", "users"
  add_foreign_key "pantries", "users"
  add_foreign_key "pantry_shifts", "pantries"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
