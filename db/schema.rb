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

ActiveRecord::Schema[7.0].define(version: 2023_06_27_192754) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_service_area_codes", force: :cascade do |t|
    t.bigint "service_area_id"
    t.string "sa_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_area_id"], name: "index_additional_service_area_codes_on_service_area_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "excavator_id"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excavator_id"], name: "index_contacts_on_excavator_id"
  end

  create_table "digsite_infos", force: :cascade do |t|
    t.string "LookupBy"
    t.string "LocationType"
    t.string "Subdivision"
    t.text "WellKnownText"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id"
    t.index ["ticket_id"], name: "index_digsite_infos_on_ticket_id"
  end

  create_table "excavation_infos", force: :cascade do |t|
    t.string "type_of_work"
    t.string "work_done_for"
    t.string "project_duration"
    t.datetime "project_start_date"
    t.string "explosives"
    t.string "underground_overhead"
    t.string "horizontal_boring"
    t.string "whitelined"
    t.text "locate_instructions"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id"
    t.index ["ticket_id"], name: "index_excavation_infos_on_ticket_id"
  end

  create_table "excavators", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.boolean "crew_onsite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id"
    t.index ["ticket_id"], name: "index_excavators_on_ticket_id"
  end

  create_table "field_contacts", force: :cascade do |t|
    t.bigint "excavator_id"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excavator_id"], name: "index_field_contacts_on_excavator_id"
  end

  create_table "primary_service_area_codes", force: :cascade do |t|
    t.bigint "service_area_id"
    t.string "sa_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_area_id"], name: "index_primary_service_area_codes_on_service_area_id"
  end

  create_table "service_areas", force: :cascade do |t|
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_service_areas_on_ticket_id"
  end

  create_table "ticket_date_times", force: :cascade do |t|
    t.datetime "request_taken_date_time", precision: nil
    t.datetime "transmission_date_time", precision: nil
    t.datetime "legal_date_time", precision: nil
    t.datetime "response_due_date_time", precision: nil
    t.datetime "restake_date", precision: nil
    t.datetime "expiration_date", precision: nil
    t.datetime "lp_meeting_accept_due_date", precision: nil
    t.datetime "overhead_begin_date", precision: nil
    t.datetime "overhead_end_date", precision: nil
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_ticket_date_times_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "request_number"
    t.string "sequence_number"
    t.string "request_type"
    t.string "request_action"
    t.datetime "response_due_date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_area_id"
    t.index ["service_area_id"], name: "index_tickets_on_service_area_id"
  end

  add_foreign_key "additional_service_area_codes", "service_areas"
  add_foreign_key "contacts", "excavators"
  add_foreign_key "digsite_infos", "tickets"
  add_foreign_key "excavation_infos", "tickets"
  add_foreign_key "excavators", "tickets"
  add_foreign_key "field_contacts", "excavators"
  add_foreign_key "primary_service_area_codes", "service_areas"
  add_foreign_key "service_areas", "tickets"
  add_foreign_key "ticket_date_times", "tickets"
  add_foreign_key "tickets", "service_areas"
end
