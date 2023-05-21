Rails.application.routes.draw do
  resource :sessions, only: [:create]  
  resource :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"

  # Encuestas
  resources :usuarios, only: [] do
    resources :encuestas, only: [:index]
  end


  #Rutas Seguras
  get :usuarios, to: "usuarios#index"
end
