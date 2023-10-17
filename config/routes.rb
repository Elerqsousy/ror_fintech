Rails.application.routes.draw do
  devise_for :users
  resources :users

  # authenticated(:user) do
  #   root "dashboard#main"
  # end
  root "users#index"
end
