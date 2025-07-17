class VeiculosController < ApplicationController
  def show
    @veiculo = Veiculo.find(params[:id])
  end
  def new
    @veiculo = Veiculo.new
  end
  def index
    @veiculos = Veiculo.all
  end
  def create
    @veiculo = Veiculo.new(veiculo_params)

    if @veiculo.save
      redirect_to @veiculo, notice: 'Manutenção criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @veiculo = Veiculo.find(params[:id])
    @veiculo.destroy
    redirect_to lista_manutencoes_path, notice: 'Veiculo excluído com sucesso.'
  end
  def edit
    @veiculo = Veiculo.find(params[:id])
  end
  def update
    @veiculo = Veiculo.find(params[:id])
    @veiculo.update(veiculo_params)
    if @veiculo.update(veiculo_params)
      redirect_to veiculo_path
    else
      render 'edit', status: :unprocessable_entify
    end
  end
  def destroy
    @veiculo = Veiculo.find(params[:id])
    if @veiculo.destroy
       redirect_to lista_veiculos_path
    else
      # Se houver erros de validação antes do destroy
      redirect_to veiculos_url, alert: 'Não foi possível excluir o veículo.'
    end

  rescue PG::ForeignKeyViolation
    redirect_to veiculos_url, alert: 'Este veículo não pode ser excluído porque possui fretes associados.'
  rescue ActiveRecord::RecordNotDestroyed
    redirect_to veiculos_url, alert: 'O veículo não pôde ser excluído. Verifique se há dependências.'
  rescue StandardError => e
    redirect_to veiculos_url, alert: "Ocorreu um erro inesperado: #{e.message}"
  end
  end

  private
  def veiculo_params
    params.require(:veiculo).permit(:placa,:marca,:modelo, :ano_fabricacao, :tipo_combustivel, :categoria_veiculo,
                                    :vel_max_controlada, :status, :quilometragem_km  )
  end

