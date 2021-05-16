Rails.application.routes.draw do
  devise_for :users
  resources :communities
  root to: "public#index"
end
