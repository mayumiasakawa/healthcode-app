Rails.application.routes.draw do
  devise_for :users
  root to: 'overviews#index'
  resources :overviews do
    collection do
      get 'physicalfinding'
    end
  end
end
