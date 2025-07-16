module MotoristaHelper
  def dados_motorista(motorista)
    link_to "#{motorista.nome} - #{motorista.cpf}", funcionario_detalhes_path(motorista)
  end
end
