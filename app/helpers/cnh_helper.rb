module CnhHelper
  def cnh_status_cor_classe(status)
    case status.downcase # Garante que a comparação seja insensível a maiúsculas/minúsculas
    when 'ativa'
      'text-success' # Verde para preventiva
    when 'suspensa'
      'text-warning'  # Vermelho para corretiva
    when 'cassada'
      'text-danger'
    when 'vencida'
      'text-secondary'
    end
  end
end
