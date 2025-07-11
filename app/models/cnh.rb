# Entidade CNH que pertence a um único funcionário/motorista
class Cnh < ApplicationRecord
  enum :cat_cnh, { A: 0, B: 1, AB: 2, ABC: 3, ABCD: 4, ABCDE: 5 }
  has_one :funcionario, class_name: "Funcionario"
end
