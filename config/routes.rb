Rails.application.routes.draw do
  get "reports/show"
  get "home/index"
  devise_for :funcionarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Rotas para pdfs
  get 'reports/show', to: 'reports#show', defaults: { format: :pdf }  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "home#index"

  # motoristas
  get "motoristas/show", to: "motoristas#dashboard", as: :motorista_dashboard
  get "motoristas", to: "motoristas#index", as: :lista_motoristas

  get "gerente/show", to: "gerente#dashboard", as: :gerente_dashboard
  get "funcionario/show/:id", to: "funcionario#show", as: :funcionario_detalhes


  # manutencoes
  resources :manutencaos
  get "manutencaos", to: "manutencao#index", as: :lista_manutencoes
  get "manutencaos/:id", to: "manutencao#show", as: :manutencao_detalhes


  # abastecimentos
  resources :abastecimentos
  get "abastecimentos", to: "abastecimento#index", as: :lista_abastecimentos
  get "abastecimento/:id", to: "abastecimento#show", as: :abastecimento_detalhes

  # fretes
  resources :fretes
  get "fretes", to: "frete#index", as: :lista_fretes
  #cnhs
  resources :cnhs
  # veiculos
  resources :veiculos
  get "veiculos", to: "veiculos#index", as: :lista_veiculos
  # get 'veiculos/:id/tipo_combustivel_select', to: 'veiculos#tipo_combustivel', as: :veiculo_tipo_combustivel_select
end
