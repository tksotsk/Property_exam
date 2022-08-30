Rails.application.routes.draw do
  root 'properties#index'
  resource :properties, only: [:index, :new, :show, :edit]
end
