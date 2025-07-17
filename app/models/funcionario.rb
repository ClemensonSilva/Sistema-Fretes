class Funcionario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :cnh, class_name: "Cnh"
  has_many :fretes,  class_name: "Frete", foreign_key: "funcionario_id"
  self.inheritance_column = :cargo
  enum :regiao_atuacao, {NORDESTE: 0, SULDESTE: 1, CENTROOESTE: 2, SUL: 3, NORTE: 4}

  def get_cnh(funcionario_id)
    Funcionario.find_by(id: funcionario_id).cnh.status
  end

  def self.get_regioes_disponiveis
    Funcionario.all
  end

  def motorista?
    self.cargo == "Motorista"
  end

  def gerente?
    self.cargo == "Gerente"
  end
end
