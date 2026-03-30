class Motorista < Funcionario
  belongs_to :supervisor, class_name: "Gerente", optional: true, foreign_key: "supervisor_id"
  has_many :fretes, class_name: "Frete", foreign_key: "funcionario_id"
  has_many :veiculos, through: :fretes

  scope :motoristas_validos, -> {
    joins(:cnh)
      .where(cargo: 'Motorista')
      .where(cnhs: { status: 0 })
      .where("cnhs.validade > ?", Date.current)
  }

  def abastecimentos_motorista(current_funcionario_id)
    Abastecimento.where(funcionario_id: current_funcionario_id)
  end
end