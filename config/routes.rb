Rails.application.routes.draw do
  get '/home', to: 'application_pages#home'
  root 'application_pages#home'
  get '/signup', to: 'users#new'
  get 'questions/new'
  get 'questions/create'
  get 'questions/edit'
  get '/search', to: 'questions#list'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :questions

end
