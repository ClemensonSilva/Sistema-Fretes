class AbastecimentosController < ApplicationController
  def show
    @abastecimento = Abastecimento.find(params[:id])
  end

  def index
    @abastecimentos = Abastecimento.all
  end

  def edit
    @abastecimento = Abastecimento.find(params[:id])
  end

  def new
    @abastecimento = Abastecimento.new
  end

  def create
    @abastecimento = Abastecimento.new(abastecimento_params)

    if @abastecimento.save
      redirect_to @abastecimento, notice: "Abastecimento criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # adicionar rescue para tratamento de erros
  def update
    @abastecimento = Abastecimento.find(params[:id])
    @abastecimento.update(abastecimento_params)
    if @abastecimento.update(abastecimento_params)
      redirect_to abastecimento_path
    else
      render "edit", status: :unprocessable_entify
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
      :quantidade_litros, :preco_litro, :nome_posto)
  end
end
