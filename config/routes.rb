Rails.application.routes.draw do
  
  root to: "homes#index"
  get "map" => "homes#map"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users do
    get :posts, on: :member
    get :shoppings, on: :member
    get :reviews, on: :member
  end

  resources :posts do
    resource :shoppings, only: [:create, :destroy]
    resource :reviews, only: [:new, :create, :destroy]
    get :reviews, on: :member
    get :ranking, on: :collection
  end

  resources :reviews, only: [:edit, :update]

end

