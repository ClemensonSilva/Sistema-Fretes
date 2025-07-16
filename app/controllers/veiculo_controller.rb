class VeiculoController < ApplicationController
  def show
    @veiculo = Veiculo.find(params[:id])
  end
  def index
    @veiculos = Veiculo.all
  end
  def destroy
    @veiculo = Veiculo.find(params[:id])
    @veiculo.destroy

    redirect_to lista_veiculos_path
  end
end

