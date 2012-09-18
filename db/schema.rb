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

ActiveRecord::Schema.define(:version => 20120918015659) do

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "email"
    t.string   "telefone"
    t.string   "rua"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "cep"
    t.string   "estado"
    t.string   "pais"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "celular"
  end

  create_table "flags", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flags_quartos", :force => true do |t|
    t.integer "flag_id"
    t.integer "quarto_id"
  end

  create_table "produtos", :force => true do |t|
    t.string   "nome"
    t.string   "desc"
    t.decimal  "valor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "quartos", :force => true do |t|
    t.string   "desc"
    t.decimal  "diaria"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "tipos_quarto_id"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  create_table "tipos_quartos", :force => true do |t|
    t.string   "nome"
    t.integer  "cama_solteiro", :limit => 255
    t.integer  "cama_casal",    :limit => 255
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "senha"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "tipo"
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
