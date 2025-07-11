class Veiculo < ApplicationRecord
  has_many :manutencaos, class_name: "Manutencao"
  has_many :abastecimentos, class_name: "Abastecimento"
  has_many :fretes, class_name: "Frete"

end
