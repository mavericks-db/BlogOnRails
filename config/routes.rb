Rails.application.routes.draw do
  get 'users/:user_id/:post_id/new_comment', to: 'comments#new', as: 'comment_new'
  post 'users/:user_id/:post_id/create_comment', to: 'comments#create', as: 'comment_create'
  get 'users/:user_id/new_post', to: 'posts#new', as: 'post_new'
  post 'users/:user_id/create_post', to: 'posts#create', as: 'post_create'
  get 'users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
