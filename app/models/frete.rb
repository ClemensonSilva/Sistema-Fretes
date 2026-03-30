# TODO ADICIONAR PROPRIEDADE CARGA AO FRETE

class Frete < ApplicationRecord
  belongs_to :veiculo, class_name: "Veiculo"
  belongs_to :funcionario, class_name: "Funcionario"
  enum :status, { EM_ANDAMENTO:0, FINALIZADO:1, NAO_INICIADO: 2}, prefix: true

  def allowed_motorista?
    cnh = Cnh.find_by(funcionario_id: self.funcionario_id)
    if cnh.present? && cnh.status == 0 && cnh.validade > Date.current
      return true
    end
  end
  
end
