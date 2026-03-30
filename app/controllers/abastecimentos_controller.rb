class AbastecimentosController < ApplicationController

  def show
    @abastecimento = Abastecimento.find(params[:id])
  end

  def index
    if current_funcionario.motorista?
      @pagy, @abastecimentos = pagy(current_funcionario.abastecimentos_motorista(current_funcionario.id))
    else
      @pagy, @abastecimentos = pagy(Abastecimento.all.order(data_abastecimento: :desc))
    end
  end

  def edit
    @abastecimento = Abastecimento.find(params[:id])
  end

  def new
    @abastecimento = Abastecimento.new
  end

  def create
    @abastecimento = Abastecimento.new(abastecimento_params)
    @abastecimento.funcionario = current_funcionario
    if @abastecimento.save
      redirect_to @abastecimento, notice: "Abastecimento criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end
 
  # adicionar rescue para tratamento de erros
  def update
    @abastecimento.update(abastecimento_params)
    if @abastecimento.update(abastecimento_params)
      redirect_to abastecimento_detalhes_path, notice: "Edição concluida com sucesso."
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @abastecimento = Abastecimento.find(params[:id])
    @abastecimento.destroy
    redirect_to lista_abastecimentos_path, notice: "Abastecimento excluído com sucesso."
  end

  private
  def abastecimento_params
    params.require(:abastecimento).permit(:tipo_combustivel, :data_abastecimento,
      :quantidade_litros, :preco_litro, :nome_posto, :veiculo_id, :comprovante)
  end
end
