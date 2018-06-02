Rails.application.routes.draw do
  # Resourses for
  resources :genero
  resources :perfil
  resources :escolaridade
  resources :usuario
  resources :dificuldade
  resources :dificuldade_cod
  resources :resultado
  resources :solucao do
    get 'frequencia', on: :collection
  end
  resources :tipo_marcacao
  resources :problema do
    get 'frequencia', on: :collection
  end
  resources :registro

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end
