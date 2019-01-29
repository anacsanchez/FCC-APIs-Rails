Rails.application.routes.draw do
  namespace :api do
    resources :timestamp, only: :index
  end
end
