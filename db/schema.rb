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

ActiveRecord::Schema.define(version: 20171101064628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.text     "title_az"
    t.string   "image"
    t.text     "body_az"
    t.integer  "author_id"
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "deleted",     default: false
    t.string   "slug"
    t.text     "title_en"
    t.text     "body_en"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id", using: :btree
  add_index "articles", ["category_id"], name: "index_articles_on_category_id", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "deleted",         default: false
    t.string   "slug"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "email"
    t.string   "password_digest"
    t.text     "bio_az"
    t.text     "bio_en"
  end

  add_index "authors", ["email"], name: "index_authors_on_email", unique: true, using: :btree
  add_index "authors", ["slug"], name: "index_authors_on_slug", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name_az"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "deleted",        default: false
    t.string   "slug"
    t.boolean  "show_in_navbar", default: true
    t.string   "name_en"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "abbr_az"
    t.text     "title_az"
    t.string   "found"
    t.string   "organization_az"
    t.text     "url_az"
    t.text     "url_en"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "deleted",         default: false
    t.text     "description_az"
    t.string   "slug"
    t.string   "category"
    t.string   "attachment_az"
    t.string   "attachment_en"
    t.string   "category_slug"
    t.string   "abbr_en"
    t.string   "title_en"
    t.string   "organization_en"
    t.text     "description_en"
  end

  add_index "documents", ["slug"], name: "index_documents_on_slug", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title_az"
    t.string   "image"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "body_az"
    t.boolean  "deleted",        default: false
    t.string   "slug"
    t.boolean  "show_in_navbar", default: true
    t.string   "title_en"
    t.text     "body_en"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "publications", force: :cascade do |t|
    t.string   "title_az"
    t.string   "author"
    t.string   "isbn"
    t.string   "price"
    t.text     "summary_az"
    t.text     "contents_az"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "attachment"
    t.string   "slug"
    t.string   "title_en"
    t.text     "summary_en"
    t.text     "contents_en"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "title_az"
    t.text     "answer_az"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "title_en"
    t.text     "answer_en"
  end

  create_table "range_tests", id: false, force: :cascade do |t|
    t.integer  "id",           default: "nextval('range_tests_id_seq'::regclass)", null: false
    t.numrange "height_range"
  end

  add_foreign_key "articles", "authors"
  add_foreign_key "articles", "categories"
end
