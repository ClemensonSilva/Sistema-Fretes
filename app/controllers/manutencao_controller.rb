class ManutencaoController < ApplicationController

  def show
    @manutencao = Manutencao.find(params[:id])
  end
  def index
    @manutencoes = Manutencao.all
  end
end
