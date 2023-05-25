Rails.application.routes.draw do
  resource :sessions, only: [:create]  
  resource :registrations, only: [:create]
  resource :rols, only: [:index, :create]
  delete :logout, to: "sessions#logout"
  get :rol, to: "rols#index" 
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"

  # Encuestas
  resources :usuarios, only: [] do
    resources :encuestas, only: [:create, :index, :show, :update, :destroy]
  end

  resources :encuestas, only: [] do
    resources :personalizacion_encuesta, only: [:create, :show, ], path: 'personalizacion_encuesta'
    put 'personalizacion_encuesta', to: 'personalizacion_encuesta#update', as: 'update_personalizacion_encuesta'
  end
  


  #Rutas Seguras
  get :usuarios, to: "usuarios#index"
end
