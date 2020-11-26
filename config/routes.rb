Rails.application.routes.draw do
  devise_for :users
  root to: 'overviews#index'
  resources :overviews
  resources :physicalfindings, only: [:index, :new, :create]
end
