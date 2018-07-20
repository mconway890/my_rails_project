Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "home#index"

  resources :users, only: [:index, :show, :edit, :update] do
    resources :recipes
  end

  resources :recipes do
    resources :reviews, only: [:new, :create, :show]
  end
  
  #resources :recipes do
  #  resources :ingredients
  #end

  resources :ingredients, only: [:new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
