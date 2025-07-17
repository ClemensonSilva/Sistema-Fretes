class MotoristasController < ApplicationController

  def dashboard
      @abastecimentos = current_funcionario.abastecimentos_motorista(current_funcionario.id)
  end
  def index
    @funcionarios = Motorista.all
  end

end
