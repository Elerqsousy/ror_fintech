Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :groups do
    resources :expenses, only: [:new, :create]
  end


  authenticated(:user) do
    root "groups#index", as: :authenticated_root
  end
  root "home#index"
end
