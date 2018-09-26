Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "home#index"

  resources :users, only: [:index, :show, :edit, :update] do
    resources :recipes
      resources :reviews, only: [:new, :create, :index, :show]
  end

  resources :recipes do
    resources :reviews, only: [:new, :create, :show]
  end

  get 'recipes/:id/recipe_data', to: 'recipes#recipe_data'

  resources :ingredients

  get 'quickest' => 'recipes#quickest'

end
