Rails.application.routes.draw do
  get "home/index"
  devise_for :funcionario
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "home#index"
  # funcionarios

  #motoristas
  get 'motorista/show', to: 'motorista#dashboard', as: :motorista_dashboard
  get 'motoristas', to: 'motorista#index', as: :lista_motoristas

  get 'gerente/show', to: 'gerente#dashboard', as: :gerente_dashboard
  get 'funcionario/:id', to: 'funcionario#show', as: :funcionario_detalhes
  # manutencoes
  get 'manutencoes', to: 'manutencao#index', as: :lista_manutencoes
  get 'manutencao/:id', to: 'manutencao#show', as: :manutencao_detalhes
  # abastecimentos
  get 'abastecimentos', to: 'abastecimento#index', as: :lista_abastecimentos
  get 'abastecimento/:id', to: 'abastecimento#show', as: :abastecimento_detalhes
  # fretes
  get 'fretes', to: 'frete#index', as: :lista_fretes
  get 'frete/:id', to: 'frete#show', as: :frete_detalhes
  #veiculos
  get 'veiculos', to: 'veiculo#index', as: :lista_veiculos
  get 'veiculo/:id', to: 'veiculo#show', as: :veiculo_detalhes

  resources :veiculo, only: [:edit , :destroy, :create]

end
