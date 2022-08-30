Rails.application.routes.draw do
  root 'properties#index'
  resources :properties, only: [:index, :new, :show, :edit]
end
