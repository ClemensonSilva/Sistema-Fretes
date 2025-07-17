class Veiculo < ApplicationRecord
  has_many :manutencaos, class_name: "Manutencao"
  has_many :abastecimentos, class_name: "Abastecimento"
  has_many :fretes, class_name: "Frete"

  enum :tipo_combustivel, { gasolina: 0, diesel: 1, etanol: 2 , flex: 3}
  enum :status, { MANUTENCAO: 0, SERVICO: 1, SINISTRO: 2 }
  enum :categoria_veiculo, { A: 0, B: 1, C: 2, D: 3, E: 4}

  def get_tipo_combustivel
    tipo_combustivel = Veiculo.find(params[:id]).tipo_combustivel
    render json: tipo_combustivel
    rescue ActiveRecord::RecordNotFound
      render json: [], status: :not_found
    end

end
