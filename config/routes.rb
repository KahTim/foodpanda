Rails.application.routes.draw do

  get 'orders/:id/braintree/new' => 'braintree#new', as: :braintree_new
  post 'orders/:id/braintree/checkout' => 'braintree#checkout', as: :braintree_checkout

  get 'orders/edit'

  get 'orders/update'

  get 'orders/destroy'

  get 'foods/new'

  get 'foods/create'

  get 'foods/show'

  get 'foods/destroy'

  # get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users
	
  resources :foods, controller: "foods" do 
    resources :orders, only: [:create, :new]
	end 

  resources :orders
	resource :logins, only: [:create, :destroy]

	root 'home#index'

end
