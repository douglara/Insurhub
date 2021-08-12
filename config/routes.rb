Rails.application.routes.draw do
  resources :insurance_programs, only: [:show]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'app/home#index'
  namespace :app do
    get 'home/index'
    get 'home/search_category'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
