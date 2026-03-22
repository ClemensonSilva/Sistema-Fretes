class GerenteController < ApplicationController
  before_action :authenticate_funcionario!
  def dashboard

    @data_inicio = params[:data_inicio].present? ? params[:data_inicio].to_date : 30.days.ago.to_date
    @data_fim = params[:data_fim].present? ? params[:data_fim].to_date : Date.current
    
    periodo = @data_inicio.beginning_of_day..@data_fim.end_of_day
    @faturamento_total = Frete.where(status: 1, data_chegada: periodo).sum(:preco)

    @custo_manutencoes = Manutencao.where(data_agendada: periodo).sum(:custo)

    @custo_abastecimentos = Abastecimento.where(data_abastecimento: periodo)
                                         .sum('preco_litro * quantidade_litros') 
    
    @custo_operacional = @custo_manutencoes + @custo_abastecimentos

    @fretes_em_andamento = Frete.where(status: 0).count

    @veiculos_total = Veiculo.count
  end

end
