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

ActiveRecord::Schema.define(version: 20170910042529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dificuldade_cods", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dificuldades", force: :cascade do |t|
    t.integer "valor"
    t.bigint "usuario_id"
    t.bigint "dificuldade_cod_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dificuldade_cod_id"], name: "index_dificuldades_on_dificuldade_cod_id"
    t.index ["usuario_id"], name: "index_dificuldades_on_usuario_id"
  end

  create_table "escolaridades", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perfils", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problemas", force: :cascade do |t|
    t.lseg "coordenadas"
    t.string "descricao"
    t.bigint "usuario_id"
    t.bigint "tipo_marcacao_id"
    t.bigint "solucao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solucao_id"], name: "index_problemas_on_solucao_id"
    t.index ["tipo_marcacao_id"], name: "index_problemas_on_tipo_marcacao_id"
    t.index ["usuario_id"], name: "index_problemas_on_usuario_id"
  end

  create_table "registros", force: :cascade do |t|
    t.string "foto_url"
    t.string "descricao"
    t.bigint "problema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problema_id"], name: "index_registros_on_problema_id"
  end

  create_table "resultados", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solucaos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "usuario_id"
    t.bigint "resultado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resultado_id"], name: "index_solucaos_on_resultado_id"
    t.index ["usuario_id"], name: "index_solucaos_on_usuario_id"
  end

  create_table "tipo_marcacaos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "password_digest"
    t.integer "ano"
    t.string "profissao"
    t.string "restricao"
    t.string "restricao_outras"
    t.bigint "genero_id"
    t.bigint "perfil_id"
    t.bigint "escolaridade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escolaridade_id"], name: "index_usuarios_on_escolaridade_id"
    t.index ["genero_id"], name: "index_usuarios_on_genero_id"
    t.index ["perfil_id"], name: "index_usuarios_on_perfil_id"
  end

  add_foreign_key "dificuldades", "dificuldade_cods"
  add_foreign_key "dificuldades", "usuarios"
  add_foreign_key "problemas", "solucaos"
  add_foreign_key "problemas", "tipo_marcacaos"
  add_foreign_key "problemas", "usuarios"
  add_foreign_key "registros", "problemas"
  add_foreign_key "solucaos", "resultados"
  add_foreign_key "solucaos", "usuarios"
  add_foreign_key "usuarios", "escolaridades"
  add_foreign_key "usuarios", "generos"
  add_foreign_key "usuarios", "perfils"
end
