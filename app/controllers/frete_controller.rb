class FreteController < ApplicationController

  #TODO ADICIONAR PROPRIEDADE CARGA AO FRETE

  def show
    @frete = Frete.find(params[:id])
  end
  def index
    @fretes = Frete.all
  end
end
