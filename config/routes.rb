Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :teacher do
    resources :submissions, only: [:index] do
      resources :feedbacks, only: [:new, :create, :edit, :update]
    end
    resources :challenges
  end

  namespace :student do
    resources :challenges, only: [:index, :show] do
      resources :submissions, only: [:new, :create]
    end
    resources :submissions, only: [:show] do
      resources :games, only: [:show, :edit, :update]
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'games/vocab', to: 'games#vocab'
end
