Rails.application.routes.draw do
  devise_for :users
  get "u/:username" => "public#profile", as: :profile
  resources :communities do
    resources :posts
  end
  resources :subscriptions
  root to: "public#index"
end
