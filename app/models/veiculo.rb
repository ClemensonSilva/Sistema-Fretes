class Veiculo < ApplicationRecord
  has_many :manutencaos
  has_many :abastecimentos
end
