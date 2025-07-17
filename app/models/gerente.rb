class Gerente < Funcionario
  # relacionamentos
  has_many :motoristas, class_name: "Motorista", foreign_key: :supervisor_id , dependent: :destroy
  has_many :fretes, through: :motoristas
  has_many :veiculos, through: :fretes


  def self.get_supervisores
    Gerente.all
  end

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
    veiculos = self.veiculos
    veiculos.each do |veiculo|
      veiculo.manutencaos
    end
    veiculos
  end
  def get_abastecimentos_supervisionados
    veiculos = self.veiculos
    veiculos.each do |veiculo|
      veiculo.abastecimentos
    end
  end
end
