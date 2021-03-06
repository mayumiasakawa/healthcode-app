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

    collection do
      get 'new_physicalfinding'
      get 'new_bloodurine'
      get 'new_medicalcare'
      get 'new_vaccine'
    end
    
  end
end
