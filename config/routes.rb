Rails.application.routes.draw do
  root 'api#index'
  resources :recipes, only: [:index]
end
