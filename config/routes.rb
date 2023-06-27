Rails.application.routes.draw do
  get 'tickets/index'
  get 'tickets/show'
  namespace :api do
    get 'tickets/create'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
