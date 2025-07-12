class CreateVeiculos < ActiveRecord::Migration[8.0]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.string :marca
      t.string :modelo
      t.date :ano_fabricacao
      t.integer :tipo_combustivel
      t.integer :categoria_veiculo
      t.float :vel_max_controlada
      t.integer :status
      t.float :quilometragem_km
      t.timestamps
    end
  end
end
