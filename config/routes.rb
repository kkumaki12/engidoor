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
  post '/application_pages/guest_sign_in', to: 'application_pages#guest_sign_in'


  resources :users
  resources :questions do
    resources :comments, only: %i[create destroy]
  end

  resources :comments do
    resource :goods, only: %i[create destroy]
    resource :best_answers, only: %i[create]
  end
  namespace 'api', {format: 'json'} do
    namespace 'v1' do
      get '/questions/list', to: 'questions#list'
      post '/login', to: 'sessions#create'
      get '/ranking', to: 'users#ranking'
      resources :questions
      resources :users
    end
  end
end
