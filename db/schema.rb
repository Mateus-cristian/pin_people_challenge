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

ActiveRecord::Schema[8.1].define(version: 2026_01_01_145101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "employees", force: :cascade do |t|
    t.text "aberta_enps"
    t.integer "aprendizado_e_desenvolvimento"
    t.string "area"
    t.string "cargo"
    t.string "celular"
    t.integer "clareza_sobre_possibilidades_de_carreira"
    t.text "comentarios_aprendizado_e_desenvolvimento"
    t.text "comentarios_clareza_sobre_possibilidades_de_carreira"
    t.text "comentarios_contribuicao"
    t.text "comentarios_expectativa_de_permanencia"
    t.text "comentarios_feedback"
    t.text "comentarios_interacao_com_gestor"
    t.text "comentarios_interesse_no_cargo"
    t.integer "contribuicao"
    t.datetime "created_at", null: false
    t.date "data_da_resposta"
    t.string "email"
    t.string "email_corporativo"
    t.integer "enps"
    t.integer "expectativa_de_permanencia"
    t.integer "feedback"
    t.string "funcao"
    t.string "genero"
    t.string "geracao"
    t.integer "interacao_com_gestor"
    t.integer "interesse_no_cargo"
    t.string "localidade"
    t.string "n0_empresa"
    t.string "n1_diretoria"
    t.string "n2_gerencia"
    t.string "n3_coordenacao"
    t.string "n4_area"
    t.string "nome"
    t.string "tempo_de_empresa"
    t.datetime "updated_at", null: false
  end
end
