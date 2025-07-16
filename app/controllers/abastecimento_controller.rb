class AbastecimentoController < ApplicationController
  def show
    @abastecimento = Abastecimento.find(params[:id])
  end
  def index
    @abastecimentos = Abastecimento.all
  end
end
