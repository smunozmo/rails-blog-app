Rails.application.routes.draw do
  devise_for :users
  get 'comments/new'
  get 'comments/create'
  get 'likes/like'
  root to: 'users#index'
  get "/users/:user_id/posts", to: "posts#index", as: "user_posts"
  post "/users/:user_id/posts", to: "posts#create", as: "user_create_post"
  get "/users/:user_id/posts/new", to: "posts#new", as: "user_new_post"
  get "/users/:user_id/posts/:id", to: "posts#show", as: "user_post"
  post "/users/:user_id/posts/:id", to: "comments#create", as: "user_create_post_comment"
  get "/users/:user_id/posts/:id/new", to: "comments#new", as: "user_new_post_comment"
  post "/users/:user_id/posts/:id/like", to: "likes#like", as: "user_create_post_like"
  get "/users", to: "users#index", as: "users"
  get "/users/:id", to: "users#show", as: "user"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
