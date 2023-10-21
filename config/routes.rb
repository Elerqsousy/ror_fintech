Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :groups 
  end

  resources :groups do
    resources :expenses
  end


  authenticated(:user) do
    root "users#index", as: :authenticated_root
  end
  root "home#index"
end
