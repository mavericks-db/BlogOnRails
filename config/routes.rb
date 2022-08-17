Rails.application.routes.draw do
  get 'users/:user_id/new', to: 'posts#new', as: 'post_new'
  post 'users/:user_id/create', to: 'posts#create', as: 'post_create'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
