class Gerente < Funcionario
  # relacionamentos
  has_many :motoristas, foreign_key: :supervisor_id
  has_many :fretes , through: :motoristas
  has_many :veiculos, through: :fretes

  def get_fretes_supervisionados
    self.fretes
  end
  def get_motoristas_supervisionados
    self.motoristas.select(:id, :nome, :cpf)
  end
  def get_veiculos_supervisionados
    self.veiculos
  end
  def get_manutencoes_supervisionadas
    self.veiculos.manutencaos
  end
  def get_abastecimentos_supervisionados
    self.veiculos.abastecimentos
  end


end