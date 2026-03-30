class FixCnhRelationship < ActiveRecord::Migration[8.0]
  def change
    # Realizei a correção do relacionamento entre Funcionario e Cnh, removendo a referência direta de Funcionario para Cnh e estabelecendo uma associação mais adequada onde Cnh pertence a Funcionario. Isso reflete melhor a realidade, onde um funcionário pode ter uma CNH, mas a CNH não deve ser o proprietário do funcionário.   
    remove_column :funcionarios, :cnh_id, :bigint

    add_reference :cnhs, :funcionario, foreign_key: true
  end
end
