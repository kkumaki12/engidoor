Rails.application.routes.draw do
  namespace "api", { format: "json" } do
    namespace "v1" do
      get "/questions/list", to: "questions#list"
      post "/login", to: "sessions#log_in"
      get "/ranking", to: "users#ranking"
      get "/bestanswer/:id", to: "questions#best"
      get "/comments_count/:id", to: "comments#comments_count"
      get "/questions/search/:search", to: "questions#search"
      get "questions/solved", to: "questions#solved_answers"
      get "comments/reply/:id", to: "comments#reply"
      get "health_check", to: "health_check#index"
      get "questions/specialty/:tag", to: "questions#specialty"

      resources :tags do
      end

      resources :users do
        resources :goods, only: %i[ index ] 
        resources :comments do
          resource :goods, only: %i[ destroy ]
        end
      end

      resources :questions
      resources :users do
        resources :questions
      end
      resources :comments do
        resource :goods, only: %i[show create destroy]
        resource :best_answers, only: %i[create]
      end
    end
  end
end
