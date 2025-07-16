module ManutencaoHelper
  def tipo_manutencao_cor_classe(tipo)
    case tipo.downcase # Garante que a comparação seja insensível a maiúsculas/minúsculas
    when 'preventiva'
      'text-success' # Verde para preventiva
    when 'corretiva'
      'text-danger'  # Vermelho para corretiva
    when 'preditiva'
      'text-info'    # Azul claro para preditiva
    when 'emergencial'
      'text-warning' # Amarelo/laranja para emergencial
    else
      'text-secondary' # Cinza padrão para outros tipos ou não especificado
    end
  end
end
