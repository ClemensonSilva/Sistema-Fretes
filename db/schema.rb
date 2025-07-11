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

ActiveRecord::Schema[8.0].define(version: 2025_07_11_172152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "abastecimentos", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.integer "tipo_combustivel"
    t.integer "data_abastecimento"
    t.float "quantidade_litros"
    t.float "preco_litro"
    t.string "nome_posto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["veiculo_id"], name: "index_abastecimentos_on_veiculo_id"
  end

  create_table "cnhs", force: :cascade do |t|
    t.string "numero_registro"
    t.integer "cat_cnh", default: 0
    t.date "data_expedicao"
    t.date "validade"
    t.bigint "funcionario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_cnhs_on_funcionario_id"
  end

  create_table "fretes", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.bigint "funcionario_id"
    t.float "preco"
    t.string "origem"
    t.string "destino"
    t.date "data_chegada"
    t.string "data_saida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_fretes_on_funcionario_id"
    t.index ["veiculo_id"], name: "index_fretes_on_veiculo_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "cargo"
    t.integer "regiao_atuacao", default: 0
    t.string "supervisor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manutencaos", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.integer "tipo"
    t.string "descricao"
    t.date "data_realizacao"
    t.float "custo"
    t.string "oficina"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["veiculo_id"], name: "index_manutencaos_on_veiculo_id"
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.string "marca"
    t.string "modelo"
    t.date "ano_fabricacao"
    t.integer "tipo_combustivel"
    t.float "vel_max_controlada"
    t.integer "status"
    t.float "quilometragem_km"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fretes", "funcionarios"
  add_foreign_key "fretes", "veiculos"
end
