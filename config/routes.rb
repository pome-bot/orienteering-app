Rails.application.routes.draw do
  devise_for :users

  root "orienteerings#index"

  resources :users
  resources :orienteerings do
    resources :controls do
      resources :answers
    end
    member do
      get "result"
    end

  end
end
