Rails.application.routes.draw do
  devise_for :users
  root to: 'overviews#index'
  resources :overviews do
    member do
      get 'physicalfinding'
      get 'bloodurine'
      get 'medicalcare'
      get 'vaccine'
    end
  end
end
