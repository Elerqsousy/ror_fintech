Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :groups 
  end

  resources :groups do
    resources :expenses
  end

  # authenticated(:user) do
  #   root "dashboard#main"
  # end
  root "users#index"
end
