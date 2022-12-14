Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' },
  controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  delete 'users/:user_id/posts/:post_id', to: 'posts#destroy', as: 'post_destroy'
  delete 'users/:user_id/posts/:post_id/comments/:comment_id', to: 'comments#destroy', as: 'comment_destroy'
  post 'users/:user_id/posts/:post_id/create_like', to: 'likes#create', as: 'like_create'
  get 'users/:user_id/:post_id/new_comment', to: 'comments#new', as: 'comment_new'
  post 'users/:user_id/:post_id/create_comment', to: 'comments#create', as: 'comment_create'
  get 'users/:user_id/new_post', to: 'posts#new', as: 'post_new'
  post 'users/:user_id/create_post', to: 'posts#create', as: 'post_create'
  get 'users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'

  # api routes
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index,:show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  root 'users#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
