class CreateCnhs < ActiveRecord::Migration[8.0]
  def change
    create_table :cnhs do |t|
      t.string :numero_registro
      t.integer  :cat_cnh, default:0
      t.date :data_expedicao
      t.date :validade
      t.references :funcionario
      t.timestamps
    end
  end
end
