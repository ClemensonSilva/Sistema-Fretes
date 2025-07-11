class CreateFuncionarios < ActiveRecord::Migration[8.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :cpf
      t.string :cargo
      t.integer  :regiao_atuacao, default:0
      t.string :supervisor_id

      t.timestamps
    end
  end
end
