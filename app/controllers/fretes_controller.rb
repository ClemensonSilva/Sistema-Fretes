class FretesController < ApplicationController
  # TODO ADICIONAR PROPRIEDADE CARGA AO FRETE
  before_action :carregar_dependencias, only: [:new, :edit, :create, :update]
  def carregar_dependencias
    @veiculos_disponiveis = Veiculo.where(status: :SERVICO)
    @motoristas = Funcionario.motoristas_validos
  end
  def show
    @frete = Frete.find(params[:id])
  end
  def edit
    @frete = Frete.find(params[:id])
  end
  def index
    if current_funcionario.motorista?
      @pagy, @fretes = pagy(current_funcionario.fretes.order(id: :desc))
    else  
      @pagy, @fretes = pagy(Frete.order(id: :desc))
    end
  end
  def new
    @frete = Frete.new
  end
  def create
    @frete = Frete.new(frete_params)
    
    if @frete.allowed_motorista? && @frete.save
      redirect_to @frete, notice: "Frete foi criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @frete = Frete.find(params[:id])
    @frete.destroy
    redirect_to fretes_url, notice: "Frete foi excluído com sucesso."
  end

  def update
    @frete = Frete.find(params[:id])
    if @frete.update(frete_params)
      redirect_to @frete, notice: "Frete foi atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
    end
  private
  def frete_params
    params.require(:frete).permit(:veiculo_id, :funcionario_id, :preco, :status, :origem, :destino, :data_chegada, :data_saida)
  end
end
