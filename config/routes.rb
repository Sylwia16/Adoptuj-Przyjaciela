Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  #home
  root 'home#index'
  get 'home/index'

  get 'contact', to: 'home#contact'
  get 'login', to: 'home#login'
  get 'gallery_cat', to: 'home#gallery_cat'
  get 'gallery_dog', to: 'home#gallery_dog'


  #admin
  get '/admin/index', to: 'admin#index'
  get '/admin/gallery_cat_admin', to: 'admin#gallery_cat_admin'
  get '/admin/gallery_dog_admin', to: 'admin#gallery_dog_admin'

  namespace :admin do
    resources :cats, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :dogs, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  #user
  get '/user/index', to: 'user#index'
  get '/user/contact', to: 'user#contact'
  get '/user/gallery_cat_user', to: 'user#gallery_cat_user'
  get '/user/gallery_dog_user', to: 'user#gallery_dog_user'

  resources :cats
  resources :dogs


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
