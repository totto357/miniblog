Rails.application.routes.draw do
  root "home#index"

  resources :statuses, only: [:create]
end
