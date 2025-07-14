class AbastecimentoController < ApplicationController
  def show
    @abastecimento = Abastecimento.find(params[:id])
  end

end
