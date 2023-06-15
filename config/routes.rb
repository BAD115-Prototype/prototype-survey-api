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
    resources :personalizacion_encuesta, only: [:index, :create ], path: 'personalizacion_encuesta', multipart: true
    put 'personalizacion_encuesta', to: 'personalizacion_encuesta#update', as: 'update_personalizacion_encuesta'
  end
  
  #Prueba preguntas
  resources :encuestas, only: [:show] do
    resources :encuestados do
      resource :respuestas
    end
    resources :resultados, only: [:index]
    resources :preguntas, only: [:create, :index, :show, :update, :destroy]
    resources :opcion_respuestas, only: [:create, :index, :show, :update, :destroy]
    get 'reports/generate_excel'
  end

  #Tipo preguntas
  resources :tipo_pregunta, only: [:index]

  #Rutas Seguras
  resources :usuarios
  resources :pantallas
  resources :generos

    
  #Roles y permisos
  resources :rols
  resources :permisos

  resources :rols, only: [:show, :update] do
    resources :permisos, only: [:index, :create]
  end

  resources :permisos, only: [:show] do
    resources :pantallas, only: [:index, :create]
  end
  get '/send_email', to: 'email#send_email'
  get '/verificar/:token', to: 'registrations#verify_email', as: 'verify_email'

end

