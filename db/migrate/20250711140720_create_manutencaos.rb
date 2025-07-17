class CreateManutencaos < ActiveRecord::Migration[8.0]
  def change
    create_table :manutencaos do |t|
      t.references :veiculo
      t.integer :tipo
      t.string :descricao
      t.date :data_agendada
      t.date :data_entrega_veiculo
      t.float :custo
      t.string :oficina
      t.timestamps
    end
  end
end
