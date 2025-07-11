# Entidade manutencao que pertecen a uma entidade Veiculo
class Manutencao < ApplicationRecord
  enum :tipo, { preventiva: 0, corretiva: 1 }
  belongs_to :veiculo
end
