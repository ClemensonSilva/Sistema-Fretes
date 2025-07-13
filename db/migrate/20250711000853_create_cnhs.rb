class CreateCnhs < ActiveRecord::Migration[8.0]
  def change
    create_table :cnhs do |t|
      t.string :numero_registro, null:false, limit: 20
      t.integer  :cat_cnh, default:0, null:false
      t.integer :status, null:false, default:0
      t.date :primeira_cnh, null:false
      t.date :data_expedicao
      t.date :validade
      t.text :observacoes, limit:100, default: "Nenhuma observação"
      t.timestamps
    end
  end
end
