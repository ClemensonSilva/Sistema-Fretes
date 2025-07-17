
module VeiculoHelper



  def placa_modelo(veiculo)
    "#{veiculo.placa} -  #{veiculo.modelo}"
  end
  def veiculo_status_cor_classe(status)
  case status.downcase # Garante que a comparação seja insensível a maiúsculas/minúsculas
  when 'servico'
    'text-success' # Verde para preventiva
  when 'manutencao'
    'text-danger'  # Vermelho para corretiva
  when 'sinistro'
    'text-info'    # Azul claro para preditiva
  else
    'text-secondary' # Cinza padrão para outros tipos ou não especificado
  end
end
end
