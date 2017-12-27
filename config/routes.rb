Rails.application.routes.draw do
  get 'foods/new'

  get 'foods/create'

  get 'foods/show'

  get 'foods/destroy'

  # get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users
	resources :foods
	resources :orders
	resource :logins, only: [:create, :destroy]

	root 'home#index'

end
