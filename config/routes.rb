Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :vehicles do
    resources :reviews
    resources :reservations
  end

  root to: 'pages#home'

  get 'dashboard' => 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
