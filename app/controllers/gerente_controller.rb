class GerenteController < ApplicationController
  before_action :authenticate_funcionario!
  def dashboard
    @faturamento_total = Frete.where(status: 'concluido').sum(:preco)

    custo_manutencoes = Manutencao.sum(:custo)
    custo_abastecimentos = Abastecimento.sum('preco_litro * quantidade_litros') 
    
    @custo_operacional = custo_manutencoes + custo_abastecimentos

    @fretes_em_andamento = Frete.where(status: 'em_andamento').count

    @veiculos_total = Veiculo.count
  end

end
