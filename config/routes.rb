Rails.application.routes.draw do
  devise_for :users

  root "orienteerings#index"

end
