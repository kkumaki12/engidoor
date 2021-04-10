Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  get '/home', to:'application_pages#home'
  root 'application_pages#home'

  resource :questions
  resource :search
end
