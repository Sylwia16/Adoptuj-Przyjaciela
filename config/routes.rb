Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  #home
  root 'home#index'
  get 'home/index'

  get 'contact', to: 'home#contact'
  get 'login', to: 'home#login'

  #admin
  get '/admin/index', to: 'admin#index'

  #user
  get '/user/index', to: 'user#index'
  get '/user/contact', to: 'user#contact'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
