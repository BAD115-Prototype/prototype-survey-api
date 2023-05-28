Rails.application.routes.draw do
  resource :sessions, only: [:create]  
  resource :registrations, only: [:create]

  delete :logout, to: "sessions#logout"

  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"

  # Encuestas
  resources :usuarios, only: [] do
    resources :encuestas, only: [:create, :index, :show, :update, :destroy]
  end

  resources :encuestas, only: [] do
    resources :personalizacion_encuesta, only: [:index, :create ], path: 'personalizacion_encuesta'
    put 'personalizacion_encuesta', to: 'personalizacion_encuesta#update', as: 'update_personalizacion_encuesta'
  end
  
  #Prueba preguntas
  resources :encuestas, only: [] do
    resources :preguntas, only: [:create, :index, :show, :update, :destroy]
  end


  #Rutas Seguras
  resources :usuarios
  resources :pantallas

    
  #Roles y permisos
  resources :rols
  resources :permisos

end

