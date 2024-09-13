Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/products/:id" => "products#show"
  get "/products" => "products#index"
  get "/suppliers" => "suppliers#index"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  post "/orders" => "orders#create"
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  
  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  
  post "/sessions" => "sessions#create"
  # get "/products/:price" => "products#show"

  # Defines the root path route ("/")
  # root "posts#index"
end
