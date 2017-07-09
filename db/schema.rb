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

ActiveRecord::Schema.define(version: 20170709111922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.string   "image"
    t.text     "body"
    t.integer  "author_id"
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "deleted",     default: false
    t.string   "slug"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id", using: :btree
  add_index "articles", ["category_id"], name: "index_articles_on_category_id", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "deleted",    default: false
    t.string   "slug"
  end

  add_index "authors", ["slug"], name: "index_authors_on_slug", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "deleted",    default: false
    t.string   "slug"
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
    t.string   "abbr"
    t.text     "title"
    t.string   "found"
    t.string   "organization"
    t.text     "url_az"
    t.text     "url_en"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "deleted",      default: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "body"
    t.boolean  "deleted",    default: false
    t.string   "slug"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree

  add_foreign_key "articles", "authors"
  add_foreign_key "articles", "categories"
end
