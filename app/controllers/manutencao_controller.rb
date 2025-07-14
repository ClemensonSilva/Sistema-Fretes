class ManutencaoController < ApplicationController

  def show
    @manutencao = Manutencao.find(params[:id])
  end
end
