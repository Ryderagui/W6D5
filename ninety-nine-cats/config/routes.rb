Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :cats do 
    resources :cat_rental_requests, only: [ :new ]
  end
  resources :cat_rental_requests, only: [ :new, :create ]

end
