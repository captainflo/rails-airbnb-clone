Rails.application.routes.draw do
  get 'reservation/index'

  get 'reservation/show'

  get 'reservation/new'

  get 'reservation/create'

  get 'reservation/edit'

  get 'reservation/update'

  get 'reservation/destroy'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
