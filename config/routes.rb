Rails.application.routes.draw do
  get 'tickets/index'
  get 'tickets/show'

  namespace :api do
    post 'tickets', to: 'tickets#create'
    get 'tickets', to: 'tickets#index'
    get 'tickect/:id/', to: 'tickets#show'
  end

  root 'api/tickets#index'
end
