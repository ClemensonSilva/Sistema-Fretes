class Gerente < Funcionario
  # relacionamentos
  has_many :motoristas, foreign_key: :supervisor_id
  has_many :fretes , through: :motoristas
  has_many :veiculos, through: :fretes
  has_many :manutencaos, through: :veiculos
  has_many :abastecimentos, through: :veiculos

    def get_fretes_supervisionados
       self.fretes
    end
    def get_motoristas_supervisionados
      self.motoristas.select(:id, :nome, :cpf)
    end
    def get_manutencoes_supervisionadas
      self.manutencaos
    end
    def get_abastecimentos_supervisionados
      self.abastecimentos
    end


end