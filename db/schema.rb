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

ActiveRecord::Schema.define(version: 2021_10_17_060419) do

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
  end

  create_table "parcels", force: :cascade do |t|
    t.integer "box_count"
    t.string "memo"
    t.integer "status"
    t.bigint "shipping_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_id"], name: "index_parcels_on_shipping_id"
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

  add_foreign_key "parcels", "shippings"
end
