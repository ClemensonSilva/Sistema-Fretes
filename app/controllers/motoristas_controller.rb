class MotoristasController < ApplicationController

  def dashboard
    @funcionario = current_funcionario
    @abastecimentos = current_funcionario.abastecimentos_motorista(current_funcionario.id)
  end
  def index
    @funcionarios = Motorista.all
  end

end
