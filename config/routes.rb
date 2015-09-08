RailsBlog::Application.routes.draw do
  resources :users
  resources :tags
  resources :sessions, only: [:create, :destroy, :new]
  resources :posts do
    resources :comments
  end

  get 'new_post', to: 'posts#new'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#create'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  root 'posts#index'
end
