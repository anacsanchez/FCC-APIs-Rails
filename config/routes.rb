Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    get '/timestamp/', to: 'timestamp#show'
    get '/timestamp/:string', to: 'timestamp#show'
  end
end
