Rails.application.routes.draw do
  get "home/index"
  devise_for :funcionarios

  # Reveal health status
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  get "motoristas/show", to: "motoristas#dashboard", as: :motorista_dashboard
  get "motoristas", to: "motoristas#index", as: :lista_motoristas

  get "gerente/show", to: "gerente#dashboard", as: :gerente_dashboard
  get "funcionario/show/:id", to: "funcionario#show", as: :funcionario_detalhes

  resources :manutencaos
  get "manutencaos", to: "manutencao#index", as: :lista_manutencoes
  get "manutencaos/:id", to: "manutencao#show", as: :manutencao_detalhes


  get "abastecimentos", to: "abastecimentos#index", as: :lista_abastecimentos
  get "abastecimento/:id", to: "abastecimentos#show", as: :abastecimento_detalhes
  
  resources :abastecimentos, except: [:index, :show] do
    member do
      patch :aprovar
      patch :rejeitar
    end
  end

  get "fretes", to: "fretes#index", as: :lista_fretes
  resources :fretes, except: [:index] do
    collection do
      post :estimar_preco
    end
  end

  resources :cnhs
  
  get "veiculos", to: "veiculos#index", as: :lista_veiculos
  resources :veiculos, except: [:index]
end