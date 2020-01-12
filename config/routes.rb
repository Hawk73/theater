Rails.application.routes.draw do
  root to: 'programs#index'

  resources :programs, only: [:create, :destroy, :new, :index]
end
