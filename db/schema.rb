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

ActiveRecord::Schema.define(version: 20150406033040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "street",       limit: 255
    t.string   "post_code",    limit: 255
    t.string   "country",      limit: 255
    t.string   "phone_number", limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "cart_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_category_id"
  end

  add_index "categories", ["parent_category_id"], name: "index_categories_on_parent_category_id", using: :btree

  create_table "exchange_rates", force: :cascade do |t|
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "package_items", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "package_items", ["package_id"], name: "index_package_items_on_package_id", using: :btree
  add_index "package_items", ["product_id"], name: "index_package_items_on_product_id", using: :btree

  create_table "packages", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "address_id"
    t.string   "track_number", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "packages", ["address_id"], name: "index_packages_on_address_id", using: :btree
  add_index "packages", ["order_id"], name: "index_packages_on_order_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["product_id"], name: "index_pictures_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "sku",         limit: 255
    t.string   "name",        limit: 255
    t.text     "desc"
    t.integer  "category_id"
    t.integer  "price"
    t.integer  "stock"
    t.boolean  "active"
    t.integer  "weight",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rmbprice"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "store_products", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "product_id"
    t.integer  "custom_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "store_products", ["product_id"], name: "index_store_products_on_product_id", using: :btree
  add_index "store_products", ["store_id"], name: "index_store_products_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "qr_code_uid",   limit: 255
    t.boolean  "show_price",                default: true
    t.integer  "price_factor",              default: 10
    t.decimal  "exchange_rate"
  end

  add_index "stores", ["name"], name: "index_stores_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
