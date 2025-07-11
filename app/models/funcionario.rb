class Funcionario < ApplicationRecord
  enum :regiao_atuacao, { NORDESTE: 0, SULDESTE: 1, NORTE: 2, CENTROOESTE: 3, SUL: 4 }
  has_one :cnh, class_name:'Cnh', dependent: :destroy
  self.inheritance_column = 'cargo'
  has_many :fretes, class_name: "Frete"
end
