Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "home#index"

  resources :users, only: [:index, :show, :edit, :update] do
    resources :recipes
  end

  resources :recipes do
    resources :reviews, only: [:new, :create, :show]
  end

  get 'quickest' => 'recipes#quickest'

  resources :ingredients, only: [:new, :create, :edit]

end
