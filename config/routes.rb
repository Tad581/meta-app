Rails.application.routes.draw do
  resources :posts
  resources :rooms
  root "pages#home"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get "users", to: "devise/session#new"
  end
  get "user/:id", to: "users#show", as: "user"

  # Defines the root path route ("/")
  # root "articles#index"
end
