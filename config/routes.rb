Rails.application.routes.draw do
  
  get '/home', to:'application_pages#home'
  root 'application_pages#home'
  get '/signup', to:'users#new' 
  get 'questions/create'
  get 'questions/edit'
  get '/search', to:'questions#list'
 

  resources :users
  resources :questions
  
end
