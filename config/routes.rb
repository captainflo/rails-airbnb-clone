Rails.application.routes.draw do
  get 'vehicles/index'

  get 'vehicles/show'

  get 'vehicles/new'

  get 'vehicles/create'

  get 'vehicles/edit'

  get 'vehicles/update'

  get 'vehicles/destroy'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
