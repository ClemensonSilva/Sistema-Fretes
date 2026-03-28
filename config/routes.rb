Rails.application.routes.draw do
  get "home/index"
  devise_for :funcionarios

  # Reveal health status
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  # motoristas
  get "motoristas/show", to: "motoristas#dashboard", as: :motorista_dashboard
  get "motoristas", to: "motoristas#index", as: :lista_motoristas

  # gerente e funcionario
  get "gerente/show", to: "gerente#dashboard", as: :gerente_dashboard
  get "funcionario/show/:id", to: "funcionario#show", as: :funcionario_detalhes

  # manutencoes
  resources :manutencaos
  get "manutencaos", to: "manutencao#index", as: :lista_manutencoes
  get "manutencaos/:id", to: "manutencao#show", as: :manutencao_detalhes


  # abastecimentos (Bloco member corrigido, controller no plural e except adicionado)
  get "abastecimentos", to: "abastecimentos#index", as: :lista_abastecimentos
  get "abastecimento/:id", to: "abastecimentos#show", as: :abastecimento_detalhes
  
  resources :abastecimentos, except: [:index, :show] do
    member do
      patch :aprovar
      patch :rejeitar
    end
  end

  # fretes (Corrigido para o plural "fretes#..." e adicionado o except)
  get "fretes", to: "fretes#index", as: :lista_fretes
  resources :fretes, except: [:index]

  # cnhs
  resources :cnhs
  
  # veiculos (Adicionado o except para evitar conflito com a rota manual)
  get "veiculos", to: "veiculos#index", as: :lista_veiculos
  resources :veiculos, except: [:index]
end