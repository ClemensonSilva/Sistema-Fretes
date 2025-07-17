# Entidade CNH que pertence a um único funcionário/motorista
class Cnh < ApplicationRecord
  enum :cat_cnh, { A: 0, B: 1, AB: 2, ABC: 3, ABCD: 4, ABCDE: 5 }
  enum :status, { ativa: 0, suspensa: 1 , cassada: 2, vencida: 4}
  has_one :funcionario, class_name: "Funcionario", dependent: :destroy


  def self.get_categorias_cnh
    Cnh.cat_cnhs.keys.map { |a| [a.humanize, a] }
  end

end
