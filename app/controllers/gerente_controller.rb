class GerenteController < ApplicationController
  before_action :authenticate_funcionario!
  def dashboard
    @funcionarios = current_funcionario.get_motoristas_supervisionados()
    @manutencoes = current_funcionario.get_manutencoes_supervisionadas()
    @fretes = current_funcionario.get_fretes_supervisionados()
    @abastecimentos = current_funcionario.get_abastecimentos_supervisionados()
    @veiculos = current_funcionario.get_veiculos_supervisionados()
  end

end
