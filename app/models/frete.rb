# TODO ADICIONAR PROPRIEDADE CARGA AO FRETE

class Frete < ApplicationRecord
  belongs_to :veiculo, class_name: "Veiculo"
  belongs_to :funcionario, class_name: "Funcionario"
  enum :status, { EM_ANDAMENTO:0, FINALIZADO:1, NAO_INICIADO: 2}, prefix: true

  scope :veiculos_disponiveis, -> { Veiculo.joins(:fretes).where.not(fretes: { status: :EM_ANDAMENTO }) }

 # def allowed_motorista?
  #  funcionario.cnh.status == 0 
  #end
  
end
