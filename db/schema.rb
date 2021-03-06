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

ActiveRecord::Schema.define(version: 2020_03_03_200845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_chosens", force: :cascade do |t|
    t.integer "voter_id"
    t.integer "candidate_id"
    t.string "candidate_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "election_date"
    t.string "ocd_id"
    t.string "election_name"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "ocd_id"
    t.string "political_party_identification"
    t.string "street_number"
    t.string "street_name"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eligible_voters", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "eligible_voter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "candidate_id"
  end

  create_table "voter_interactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "voter_id"
    t.boolean "contact_made"
    t.string "contact_not_made_reason"
    t.boolean "vote_in_current_election"
    t.string "date_of_interaction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "candidate_id"
    t.boolean "candidate_support"
  end

  create_table "voters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "gender"
    t.string "political_party_identification"
    t.string "street_number"
    t.string "street_name"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
