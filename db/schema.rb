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

ActiveRecord::Schema.define(version: 2022_01_07_065100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "type"
    t.string "owner_name"
    t.string "ssn"
    t.string "phone1"
    t.string "phone2"
    t.string "zipcode"
    t.string "address1"
    t.string "address2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address1"], name: "index_addresses_on_address1"
    t.index ["address2"], name: "index_addresses_on_address2"
    t.index ["owner_name"], name: "index_addresses_on_owner_name"
    t.index ["phone1"], name: "index_addresses_on_phone1"
    t.index ["phone2"], name: "index_addresses_on_phone2"
    t.index ["ssn"], name: "index_addresses_on_ssn"
    t.index ["type", "owner_name", "ssn", "phone1", "phone2", "zipcode", "address1", "address2"], name: "index_addresses_on_all"
    t.index ["type"], name: "index_addresses_on_type"
    t.index ["zipcode"], name: "index_addresses_on_zipcode"
  end

  create_table "customs", force: :cascade do |t|
    t.integer "customs_type"
    t.integer "recipient_type"
    t.bigint "shipping_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_id"], name: "index_customs_on_shipping_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "weight"
    t.string "order_number"
    t.string "product_name"
    t.integer "count"
    t.integer "price"
    t.integer "hs_code"
    t.bigint "shipping_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_name"], name: "index_orders_on_product_name"
    t.index ["shipping_id"], name: "index_orders_on_shipping_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.integer "box_count"
    t.string "memo"
    t.integer "status"
    t.bigint "shipping_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["memo"], name: "index_parcels_on_memo"
    t.index ["shipping_id"], name: "index_parcels_on_shipping_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "to_tsvector('simple'::regconfig, COALESCE(content, ''::text))", name: "index_pg_search_documents_on_content", using: :gin
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "shippings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "to_address_id"
    t.integer "from_address_id"
    t.index ["from_address_id"], name: "index_shippings_on_from_address_id"
    t.index ["to_address_id"], name: "index_shippings_on_to_address_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.boolean "lockable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "customs", "shippings"
  add_foreign_key "orders", "shippings"
  add_foreign_key "parcels", "shippings"
end
