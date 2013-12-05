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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131229095506) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "banners", :force => true do |t|
    t.integer  "offer_id",                     :null => false
    t.text     "bannersrc",                    :null => false
    t.boolean  "is_active",  :default => true
    t.string   "width"
    t.string   "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.boolean  "is_active",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "category_relations", :force => true do |t|
    t.integer  "category_id"
    t.integer  "game_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "category_id"
    t.integer  "provider_id"
    t.integer  "platform_id"
    t.string   "title"
    t.string   "short_text"
    t.text     "body"
    t.string   "keywords"
    t.string   "descriptions"
    t.boolean  "is_active",                :default => true
    t.boolean  "is_recomend"
    t.boolean  "is_best"
    t.boolean  "in_spec_block"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_promo_file_name"
    t.string   "image_promo_content_type"
    t.integer  "image_promo_file_size"
    t.datetime "image_promo_updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "title"
    t.string   "uri"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "parent_id"
    t.boolean  "in_main"
    t.boolean  "in_footer"
    t.boolean  "in_special"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offers", :force => true do |t|
    t.text     "name",        :null => false
    t.text     "offerlink",   :null => false
    t.text     "category",    :null => false
    t.boolean  "locked",      :null => false
    t.text     "description", :null => false
    t.text     "bannerlink",  :null => false
    t.text     "cpl",         :null => false
    t.text     "cpa",         :null => false
    t.text     "epc7d",       :null => false
    t.text     "epc90d",      :null => false
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platform_relations", :force => true do |t|
    t.integer  "platform_id"
    t.integer  "game_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "platforms", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.boolean  "is_active",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "provider_relations", :force => true do |t|
    t.integer  "provider_id"
    t.integer  "game_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.boolean  "is_active",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sliders", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.integer  "platform_id"
    t.string   "uri"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "static_pages", :force => true do |t|
    t.string   "title"
    t.text     "anounce"
    t.text     "text"
    t.string   "uri"
    t.boolean  "on_main",    :default => true
    t.boolean  "on_list",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
