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

ActiveRecord::Schema.define(version: 20170714064946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "attachable_id"
    t.integer  "user_id"
    t.string   "attachable_type"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_type"
    t.string   "title"
    t.text     "text"
    t.string   "target"
    t.datetime "schedule"
    t.boolean  "confirmed"
    t.integer  "status"
    t.integer  "message_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  add_index "comments", ["owner_id"], name: "index_comments_on_owner_id", using: :btree

  create_table "document_translations", force: :cascade do |t|
    t.integer  "document_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
  end

  add_index "document_translations", ["document_id"], name: "index_document_translations_on_document_id", using: :btree
  add_index "document_translations", ["locale"], name: "index_document_translations_on_locale", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "position"
    t.integer  "file_group_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "documents", ["file_group_id"], name: "index_documents_on_file_group_id", using: :btree

  create_table "file_group_translations", force: :cascade do |t|
    t.integer  "file_group_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "description"
  end

  add_index "file_group_translations", ["file_group_id"], name: "index_file_group_translations_on_file_group_id", using: :btree
  add_index "file_group_translations", ["locale"], name: "index_file_group_translations_on_locale", using: :btree

  create_table "file_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "integrations", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "name"
    t.string   "url"
    t.integer  "auth_type"
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "name_generations", force: :cascade do |t|
    t.string "name"
    t.text   "domains_info"
  end

  create_table "novelties", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "tag",                 default: "none"
    t.integer  "novelty_category_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "novelty_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "domain"
    t.string   "subdomain"
  end

  create_table "organizations_users", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "user_id"
    t.integer "role"
  end

  add_index "organizations_users", ["organization_id"], name: "index_organizations_users_on_organization_id", using: :btree
  add_index "organizations_users", ["user_id"], name: "index_organizations_users_on_user_id", using: :btree

  create_table "page_translations", force: :cascade do |t|
    t.integer  "page_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "body"
    t.string   "description"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale", using: :btree
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "visible",    default: false
    t.integer  "position"
    t.string   "url"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  add_index "projects", ["owner_id"], name: "index_projects_on_owner_id", using: :btree

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.integer "role",       default: 0
  end

  create_table "system_admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "system_admins", ["email"], name: "index_system_admins_on_email", unique: true, using: :btree
  add_index "system_admins", ["reset_password_token"], name: "index_system_admins_on_reset_password_token", unique: true, using: :btree

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "org_role",         default: 0
    t.string   "teaching_courses"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.boolean  "system_admin",           default: false
    t.integer  "language",               default: 0
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "mobile"
    t.text     "about"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "documents", "file_groups"
  add_foreign_key "identities", "users"
  add_foreign_key "user_profiles", "users"
end
