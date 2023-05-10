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

ActiveRecord::Schema.define(version: 2023_05_10_110236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "item_id", null: false
    t.integer "criteria", null: false
    t.integer "price"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_carts_on_discarded_at"
  end

  create_table "category_groceries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "criteria_days", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "item_id", null: false
    t.integer "criteria", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groceries", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_grocery_id", null: false
    t.bigint "sub_category_grocery_id", null: false
    t.bigint "item_id", null: false
    t.index ["category_grocery_id"], name: "index_groceries_on_category_grocery_id"
    t.index ["item_id"], name: "index_groceries_on_item_id"
    t.index ["sub_category_grocery_id"], name: "index_groceries_on_sub_category_grocery_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "criteria", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "makers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "picture", default: "default.png"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_product_id", null: false
    t.bigint "sub_category_product_id", null: false
    t.bigint "item_id", null: false
    t.bigint "maker_id", null: false
    t.index ["category_product_id"], name: "index_products_on_category_product_id"
    t.index ["item_id"], name: "index_products_on_item_id"
    t.index ["maker_id"], name: "index_products_on_maker_id"
    t.index ["sub_category_product_id"], name: "index_products_on_sub_category_product_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "nickname"
    t.integer "roommate_number", default: 1, null: false
    t.string "prefecture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "request_type", null: false
    t.string "request_name", null: false
    t.boolean "register_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "prefecture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_items", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.integer "criteria", null: false
    t.bigint "item_id", null: false
    t.date "alarm_date", null: false
    t.integer "price"
    t.bigint "shop_id"
    t.integer "quantity"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_stock_items_on_discarded_at"
  end

  create_table "sub_category_groceries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_grocery_id", null: false
    t.index ["category_grocery_id"], name: "index_sub_category_groceries_on_category_grocery_id"
  end

  create_table "sub_category_products", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_product_id", null: false
    t.index ["category_product_id"], name: "index_sub_category_products_on_category_product_id"
  end

  create_table "to_buy_lists", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "item_id", null: false
    t.boolean "buy_flag", default: false
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_to_buy_lists_on_discarded_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.boolean "admin", default: false
    t.boolean "business", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_id", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_on"
    t.json "tokens"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "groceries", "category_groceries"
  add_foreign_key "groceries", "items"
  add_foreign_key "groceries", "sub_category_groceries"
  add_foreign_key "products", "category_products"
  add_foreign_key "products", "items"
  add_foreign_key "products", "makers"
  add_foreign_key "products", "sub_category_products"
  add_foreign_key "profiles", "users"
  add_foreign_key "sub_category_groceries", "category_groceries"
  add_foreign_key "sub_category_products", "category_products"
  add_foreign_key "users", "groups"
end
