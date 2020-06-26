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

ActiveRecord::Schema.define(version: 2020_06_26_094841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_histories", force: :cascade do |t|
    t.bigint "bill_id"
    t.integer "month"
    t.integer "year"
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_id"], name: "index_bill_histories_on_bill_id"
  end

  create_table "bills", force: :cascade do |t|
    t.string "name"
    t.string "image_icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loan_payments", force: :cascade do |t|
    t.bigint "loan_id"
    t.decimal "payed_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_id"], name: "index_loan_payments_on_loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.text "description"
    t.decimal "loaned_amount"
    t.decimal "default_installment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bill_histories", "bills"
  add_foreign_key "loan_payments", "loans"
end
