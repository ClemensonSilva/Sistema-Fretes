class Funcionario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cnh, class_name: "Cnh", dependent: :destroy
  has_many :fretes,  class_name: "Frete", foreign_key: "funcionario_id"
  has_many :abastecimentos, foreign_key: "funcionario_id"
  before_validation :formatar_documentos
  validates :cpf, presence: true, uniqueness: true, cpf: true

  scope :motoristas_validos, -> {
    joins(:cnh)
      .where(cargo: 'Motorista')
      .where(cnhs: { status: 0 }) # status: ativa
      .where("cnhs.validade > ?", Date.current)
  }
  

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

  private

  def formatar_documentos
    self.cpf = CPF.new(cpf).stripped if cpf.present?
  end
end
