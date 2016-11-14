Rails.application.routes.draw do
<<<<<<< HEAD
  get 'reservation/index'

  get 'reservation/show'

  get 'reservation/new'

  get 'reservation/create'

  get 'reservation/edit'

  get 'reservation/update'

  get 'reservation/destroy'

=======
  devise_for :users
>>>>>>> d4c753ba7e192786a6bc9435e5efca23e630b41c
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
