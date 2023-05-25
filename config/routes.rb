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
    resources :encuestas, only: [:index, :show]
  end

  resources :encuestas, only: [] do
    resource :personalizacion_encuesta, only: [:show], path: 'personalizacion_encuesta'
  end
  


  #Rutas Seguras
  get :usuarios, to: "usuarios#index"
end
