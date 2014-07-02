Links::Application.routes.draw do
  
  root to: "sessions#new"
  resources :users
  resources :links do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resource :session
  resources :posts do
    resources :tags, only: [:create]
  end
  resources :tags, only: [:destroy]

end
