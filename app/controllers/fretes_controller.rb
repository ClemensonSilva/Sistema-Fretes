class FretesController < ApplicationController
  # TODO ADICIONAR PROPRIEDADE CARGA AO FRETE
  before_action :carregar_dependencias, only: [:new, :edit, :create, :update]
  def carregar_dependencias
    @veiculos_disponiveis = Veiculo.where(status: :SERVICO)
    @motoristas = Funcionario.motoristas_validos
  end
  # TODO implementar método para estimar o tempo da entrega baseando-se na distância e 
  # a velocidade média controlada do veículo selecionado aplicando fator de correção possíveis imprevistos
  def estimar_preco
    origem = "#{params[:origem_cidade]} - #{params[:origem_uf]}"
    destino = "#{params[:destino_cidade]} - #{params[:destino_uf]}"

    resultado = ::CalculadoraFreteEstimadoService.call(origem, destino) # pretendo refatorar e configurar o namespace

    if resultado
      render json: { 
        sucesso: true, 
        distancia_km: resultado[:distancia_km], 
        preco_sugerido: resultado[:preco_sugerido] 
      }
    else
      render json: { 
        sucesso: false, 
        erro: "Não foi possível localizar uma das cidades no mapa." 
      }, status: :unprocessable_entity
    end
  end
  def show
    @frete = Frete.find(params[:id])
  end
  def edit
    @frete = Frete.find(params[:id])
  end

  def index
    if current_funcionario&.motorista?
      @pagy, @fretes = pagy(current_funcionario.fretes.order(id: :desc))
    else  
      @pagy, @fretes = pagy(current_funcionario&.get_fretes_supervisionados.order(id: :desc))
    end
  end
  
  def new
    @frete = Frete.new
  end
  def create
    @frete = Frete.new(frete_params)
    @frete.status = :NAO_INICIADO
    #unless @frete.allowed_motorista?
     # @frete.errors.add(:funcionario_id, "deve possuir CNH válida para ser selecionado como motorista.")
      #render :new, status: :unprocessable_entity
      #return
    #end

    if @frete.save
      redirect_to lista_fretes_path, notice: "Frete foi criado com sucesso."
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
   
  def carregar_dependencias
    @veiculos_disponiveis = Frete.veiculos_disponiveis
    @motoristas = Funcionario.motoristas_validos
  end

  def frete_params
    params.require(:frete).permit(:veiculo_id, :funcionario_id, :origem_uf, :origem_cidade, :preco, :status, :destino_uf, :destino_cidade, :data_chegada, :data_saida)
  end
end
