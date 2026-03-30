class ManutencaosController < ApplicationController
  def show
    @manutencao = Manutencao.find(params[:id])
  end
  def index
    @pagy, @manutencoes = pagy(Manutencao.all.order(data_agendada: :desc))
  end
  def new
    @manutencao = Manutencao.new
  end

  def edit
    @manutencao = Manutencao.find(params[:id])
    
  end
  def new
    @manutencao = Manutencao.new
  end
  def create
    @manutencao = Manutencao.new(manutencao_params)

    if @manutencao.save
      redirect_to @manutencao, notice: "Manutenção criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @manutencao = Manutencao.find(params[:id])
    @manutencao.destroy
    redirect_to lista_manutencoes_path, notice: "Manutenção excluída com sucesso."
  end

  def update
    @manutencao = Manutencao.find(params[:id])
    if @manutencao.update(manutencao_params)
      redirect_to manutencao_detalhes_path,  notice: "Edição concluída com sucesso"
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private
  def manutencao_params
    params.require(:manutencao).permit(:veiculo_id, :tipo, :descricao, :data_agendada, :data_entrega_veiculo, :custo, :oficina)
  end
end
