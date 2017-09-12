Rails.application.routes.draw do
  resources :registros
  resources :problemas
  resources :tipo_marcacaos
  resources :solucaos
  resources :resultados
  resources :dificuldades
  resources :dificuldade_cods
  resources :usuarios
  resources :escolaridades
  resources :perfils
  resources :generos
  resources :usuario
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end
