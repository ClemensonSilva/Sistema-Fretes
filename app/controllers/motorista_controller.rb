class MotoristaController < ApplicationController

  def dashboard
      @abastecimentos = current_funcionario.abastecimentos_motorista(current_funcionario.id)
  end

end
