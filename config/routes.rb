Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do

      post "signup" => "users#create", as: "signup"
      post "signin" => "sessions#login", as: "signin"
      get "user_info" => "users#show", as: "user_info"
    end
  end
end
