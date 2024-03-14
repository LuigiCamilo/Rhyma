Rails.application.routes.draw do
  resources :courses do
    resources :lectures
  end

  devise_for :users

  root to: "pages#home"

  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post 'next' => 'advances#next', as: :next_lecture
  post 'previous' => 'advances#previous', as: :prev_lecture
  # resources :users, only: [:show]

  # Defines the root path route ("/")
  # root "posts#index"
end
