Rails.application.routes.draw do
  devise_for :users
  root to: 'overviews#index'
  resources :overviews do
    collection do
      get 'new_physicalfinding'
    end
    
    member do
      get 'physicalfinding'
      get 'bloodurine'
      get 'medicalcare'
      get 'vaccine'
    end
  end
end
