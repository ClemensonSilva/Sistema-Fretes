class Veiculo < ApplicationRecord
  has_many :manutencaos, class_name: "Manutencao"
  has_many :abastecimentos, class_name: "Abastecimento"
  has_many :fretes, class_name: "Frete"
  enum :status, { MANUTENCAO: 0, SERVICO: 1, SINISTRO: 2 }
  enum :categoria_veiculo, { A: 0, B: 1, C: 2, D: 3, E: 4}
end
