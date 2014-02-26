TestStorage::Application.routes.draw do
  devise_for :users

  resources :assets

  root to: "assets#index"
end
