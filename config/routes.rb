Rails.application.routes.draw do
  resources :posts, :except => [:new, :show]
  resources :profiles, :except => [:new]
  devise_for :sellers
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "home#index"
  get '/pages/user' => 'page#user', :as => 'user_page'
  get '/profiles/new/:user_id/:is_seller' => 'profiles#new', :as => "new_profile"
  get '/posts/new/:user_id/:is_job/:receiver_id' => 'posts#new', :as => "new_post"
  get '/posts/:slug' => 'posts#show', :as => "post_slug"
end
