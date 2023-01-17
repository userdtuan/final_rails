Rails.application.routes.draw do
  resources :posts, :except => [:new]
  resources :profiles, :except => [:new]
  devise_for :sellers
  devise_for :users
  root "home#index"
  get '/pages/user' => 'page#user', :as => 'user_page'
  get '/profiles/new/:user_id/:is_seller' => 'profiles#new', :as => "new_profile"
  get '/freelancer-page' => 'home#freelancer_page', :as => "freelancer_page"

  scope '/jobs' do
    get '/search/:keyword' => 'home#search_job', :as => "search_job"
    get '/category/:keyword/:page' => 'home#category_job', defaults: { page: 1 }, :as => "category_job"
    get '/page/:page' => 'home#index', :as => 'page'
    get '/new/:user_id/:is_job/:receiver_id' => 'posts#new', :as => "new_post"
    get '/:slug' => 'posts#show', :as => "post_slug"
    get '/dashboard/requests' => 'posts#manage_request', :as => "manage_request"
    get '/dashboard/jobs' => 'posts#manage_job', :as => "manage_job"
    # get '/request/:seller_id' => 'posts#createRequest', :as => "job_request"
  end
end
