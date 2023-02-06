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

ActiveRecord::Schema[7.0].define(version: 2023_02_06_095142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "headline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "location"
    t.bigint "job_id"
    t.integer "stage"
    t.text "notes"
    t.index ["job_id"], name: "index_candidates_on_job_id"
  end

  create_table "job_boards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "seo_title"
    t.text "seo_description"
    t.string "url"
    t.string "custom_domain_url"
    t.text "intro"
    t.integer "og_image_setup"
    t.integer "header_setup"
    t.string "slug"
    t.bigint "organization_id"
    t.integer "banner_setup"
    t.string "banner_video_url"
    t.string "cname"
    t.boolean "custom_domain_valid", default: false
    t.index ["organization_id"], name: "index_job_boards_on_organization_id"
    t.index ["slug"], name: "index_job_boards_on_slug", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "valid_through"
    t.string "employment_type"
    t.float "base_salary"
    t.string "applicant_requirement_location"
    t.string "slug"
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.integer "status", default: 1
    t.integer "needs", default: 1
    t.index ["organization_id"], name: "index_jobs_on_organization_id"
    t.index ["slug"], name: "index_jobs_on_slug", unique: true
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.jsonb "reactions"
    t.boolean "system", default: false
    t.boolean "saved", default: false
    t.boolean "distributed", default: false
    t.boolean "seen", default: false
    t.boolean "deleted", default: false
    t.boolean "failure", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "website_url"
    t.integer "remote_level"
    t.string "slug"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_organizations_on_slug", unique: true
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "organizations_users", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.boolean "active", default: false
    t.index ["organization_id", "user_id"], name: "index_organizations_users_on_organization_id_and_user_id"
    t.index ["user_id", "organization_id"], name: "index_organizations_users_on_user_id_and_organization_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_participants_on_room_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_rooms_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "full_name"
    t.integer "provider"
    t.string "profile_picture_url"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "jobs", "organizations"
  add_foreign_key "jobs", "users"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "participants", "rooms"
  add_foreign_key "participants", "users"
end
