Rails.application.routes.draw do
  resource :sessions, only: [:create]  
  root to: "static#home"
end
