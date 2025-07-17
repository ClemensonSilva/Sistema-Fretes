# Possui os atributos: - data: Date
# - tipoCombustivel: string
# - quantidadeLt: float
# - precoLitro: float
# - nomePosto:string
class Abastecimento < ApplicationRecord
  enum :tipo_combustivel, { gasolina: 0, diesel: 1, etanol: 2 }
  belongs_to :veiculo, class_name: "Veiculo"



end
