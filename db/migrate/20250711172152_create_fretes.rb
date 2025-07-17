class CreateFretes < ActiveRecord::Migration[8.0]
  def change
    create_table :fretes do |t|
      t.references :veiculo, foreign_key: true
      t.references :funcionario, foreign_key: true
      t.float :preco
      t.integer :status
      t.string :origem
      t.string :destino
      t.date :data_chegada
      t.date :data_saida

      t.timestamps
    end
  end
end
