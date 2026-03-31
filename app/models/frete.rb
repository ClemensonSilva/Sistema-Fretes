# TODO ADICIONAR PROPRIEDADE CARGA AO FRETE

class Frete < ApplicationRecord
  belongs_to :veiculo, class_name: "Veiculo"
  belongs_to :funcionario, class_name: "Funcionario"
  enum :status, { EM_ANDAMENTO:0, FINALIZADO:1, NAO_INICIADO: 2}, prefix: true
  
  attr_accessor :origem_uf, :origem_cidade, :destino_uf, :destino_cidade

  scope :veiculos_disponiveis, -> { Veiculo.joins(:fretes).where.not(fretes: { status: :EM_ANDAMENTO }) }
  
  before_validation :formatar_origem_destino
  validates :origem, :destino, presence: true


  private
  def formatar_origem_destino
    if origem_uf.present? && origem_cidade.present?
      self.origem = "#{origem_cidade}, #{origem_uf}"
    end
    if destino_uf.present? && destino_cidade.present?
      self.destino = "#{destino_cidade}, #{destino_uf}"
    end
  end



 # def allowed_motorista?
  #  funcionario.cnh.status == 0 
  #end


  
end
