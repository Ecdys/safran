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

ActiveRecord::Schema.define(:version => 20111017170736) do

  create_table "articles", :force => true do |t|
    t.string   "distributeur"
    t.string   "societe"
    t.string   "fabricant"
    t.string   "description"
    t.string   "code_article"
    t.float    "prix_unitaire"
    t.integer  "quantite_max"
    t.string   "devise"
    t.date     "date_effective"
    t.date     "date_expiration"
    t.integer  "moq"
    t.integer  "multiple"
    t.integer  "delai_livraison"
    t.string   "unite_livraison"
    t.string   "description_etendue"
    t.string   "code_fournisseur_societe"
    t.string   "code_article_societe"
    t.string   "unite_achat"
    t.string   "famille"
    t.string   "code_commodite"
    t.string   "image"
    t.decimal  "taxe",                     :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "couleurs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "keyword"
  end

  create_table "generals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "keyword"
  end

  create_table "matieres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "keyword"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
