class CreateAbastecimentos < ActiveRecord::Migration[8.0]
  def change
    create_table :abastecimentos do |t|
      t.references :veiculo
      t.integer :tipo_combustivel
      t.integer :data_abastecimento
      t.float :quantidade_litros
      t.float :preco_litro
      t.string :nome_posto
      t.timestamps
    end
  end
end
