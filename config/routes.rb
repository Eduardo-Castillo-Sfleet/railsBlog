Rails.application.routes.draw do
  resources :comments
  devise_for :users
  #get 'welcome/index'
  #get "special", to: "welcome#index"


  resources :articles
    

  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
