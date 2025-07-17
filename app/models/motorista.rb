class Motorista < Funcionario
  belongs_to :supervisor, class_name: "Gerente", optional: true, foreign_key: "supervisor_id"
  has_many :fretes, class_name: "Frete", foreign_key: "funcionario_id"
  has_many :veiculos, through: :fretes


  def abastecimentos_motorista(current_funcionario_id)
    Abastecimento.joins(veiculo: { fretes: :funcionario })
                 .where("abastecimentos.data_abastecimento BETWEEN fretes.data_chegada AND fretes.data_saida")
                 .where(funcionario: { id: current_funcionario_id})
  end
end