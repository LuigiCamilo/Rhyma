Rails.application.routes.draw do
  get 'courses/:course_id/complete' => 'courses#complete', as: :course_complete
  resources :courses do
    resources :lectures
  end
  resources :reviews, only: [:create]
  devise_for :users

  root to: "pages#home"

  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post 'next' => 'advances#next', as: :next_lecture
  # resources :users, only: [:show]

  # Defines the root path route ("/")
  # root "posts#index"
end
