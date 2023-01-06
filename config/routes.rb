Rails.application.routes.draw do
  resources :profiles, :except => [:new]
  devise_for :sellers
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get '/pages/user' => 'page#user', :as => 'user_page'
  get '/profiles/new/:user_id/:is_seller' => 'profiles#new', :as => "new_profile"
end
