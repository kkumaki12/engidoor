Rails.application.routes.draw do
  
  get '/home', to:'application_pages#home'
  root 'application_pages#home'
  get '/signup', to:'users#new'
  

  resource :questions
  resource :search
end
