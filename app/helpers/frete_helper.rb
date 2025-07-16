module FreteHelper
  def frete_status_cor_classe(status)
    case status.downcase
    when "em_andamento"
      'text-danger'
    when "finalizado"
      'text-success'
    when "nao_iniciado"
      'text-warning'
    end
  end
  def frete_status_texto(status)
    case status.downcase
    when "em_andamento"
      "Em andamento"
    when "finalizado"
      'Finalizado'
    when "nao_iniciado"
      'Não iniciado'
    end
  end
end
