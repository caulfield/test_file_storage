TestStorage::Application.routes.draw do
  devise_for :users

  resources :assets do
    get '/files/:filename', action: :file, on: :member
  end

  root to: "assets#index"
end
