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

ActiveRecord::Schema[8.0].define(version: 2026_03_22_182329) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "abastecimentos", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.integer "tipo_combustivel"
    t.date "data_abastecimento"
    t.float "quantidade_litros"
    t.float "preco_litro"
    t.string "nome_posto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "funcionario_id", null: false
    t.integer "status", default: 0, null: false
    t.index ["funcionario_id"], name: "index_abastecimentos_on_funcionario_id"
    t.index ["veiculo_id"], name: "index_abastecimentos_on_veiculo_id"
  end

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

  create_table "cnhs", force: :cascade do |t|
    t.string "numero_registro", limit: 20, null: false
    t.integer "cat_cnh", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.date "primeira_cnh", null: false
    t.date "data_expedicao"
    t.date "validade"
    t.text "observacoes", default: "Nenhuma observação"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fretes", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.bigint "funcionario_id"
    t.float "preco"
    t.integer "status"
    t.string "origem"
    t.string "destino"
    t.date "data_chegada"
    t.date "data_saida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_fretes_on_funcionario_id"
    t.index ["veiculo_id"], name: "index_fretes_on_veiculo_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nome", null: false
    t.string "cpf", null: false
    t.string "cargo"
    t.integer "regiao_atuacao"
    t.bigint "supervisor_id"
    t.bigint "cnh_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnh_id"], name: "index_funcionarios_on_cnh_id"
    t.index ["email"], name: "index_funcionarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_funcionarios_on_reset_password_token", unique: true
    t.index ["supervisor_id"], name: "index_funcionarios_on_supervisor_id"
  end

  create_table "manutencaos", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.integer "tipo"
    t.string "descricao"
    t.date "data_agendada"
    t.date "data_entrega_veiculo"
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
    t.integer "categoria_veiculo"
    t.float "vel_max_controlada"
    t.integer "status"
    t.float "quilometragem_km"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "abastecimentos", "funcionarios"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fretes", "funcionarios"
  add_foreign_key "fretes", "veiculos"
end
