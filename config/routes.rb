TestStorage::Application.routes.draw do
  devise_for :users

  resources :assets, only: [:index]

  root to: "assets#index"
end
