class CnhsController < ApplicationController
  def index
    @cnh = Cnh.all
  end

  def new
    @cnh = Cnh.new
  end

  def show
    @cnh = Cnh.find(params[:id])
  end

  def edit
    @cnh = Cnh.find(params[:id])
  end

  def update
    @cnh = Cnh.find(params[:id])
    if @cnh.update(cnh_params)
      redirect_to @cnh, notice: "CNH atualizada com sucesso!"
    else
      render :edit, status: :unprocessable_entity # Renderiza o formulário de 'edit' novamente com erros
    end
  end

  def create
    @cnh = Cnh.new(cnh_params)

    if @cnh.save
      redirect_to @cnh, notice: "CNH criada com sucesso!"
    else
      render :new, status: :unprocessable_entity # Renderiza o formulário de 'new' novamente com erros
    end
  end

  def destroy
    @cnh.destroy
    redirect_to cnhs_url, notice: "CNH excluída com sucesso."
  end

  private

  def cnh_params
    params.require(:cnh).permit(:numero_registro, :cat_cnh, :status, :primeira_cnh, :data_expedicao, :validade, :observacoes)
  end
end
