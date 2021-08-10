Rails.application.routes.draw do
  root 'app/home#index'
  namespace :app do
    get 'home/index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
