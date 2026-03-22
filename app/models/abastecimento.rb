# Possui os atributos: - data: Date
# - tipoCombustivel: string
# - quantidadeLt: float
# - precoLitro: float
# - nomePosto:string
class Abastecimento < ApplicationRecord
  enum :tipo_combustivel, { gasolina: 0, diesel: 1, etanol: 2 }
  belongs_to :veiculo, class_name: "Veiculo"
  belongs_to :funcionario, class_name: "Funcionario"
  has_one_attached :nota_fiscal
end
