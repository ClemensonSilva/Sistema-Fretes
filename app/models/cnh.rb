# Entidade CNH que pertence a um único funcionário/motorista
class Cnh < ApplicationRecord
  enum :cat_cnh, { A: 0, B: 1, AB: 2, ABC: 3, ABCD: 4, ABCDE: 5 }, prefix: :true
  enum :status, { ativa: 0, suspensa: 1 , cassada: 2, vencida: 3}, prefix: true
  belongs_to :funcionario, class_name: "Funcionario", optional: true, foreign_key: "funcionario_id"
  
  before_validation :formatar_cnh
  validates :numero_registro, presence: true, uniqueness: true, cnh: true

  def self.get_categorias_cnh
    Cnh.cat_cnhs.keys.map { |a| [a.humanize, a] }
  end
  def formatar_cnh
    self.numero_registro = numero_registro.to_s.gsub(/\D/, '') if numero_registro.present?
  end
end
