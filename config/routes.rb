Rails.application.routes.draw do
  resources :programs, only: [:create, :destroy, :new, :index]
end
