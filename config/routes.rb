Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", sessions: 'users/sessions' }, path: 'auth', path_names: {}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'distribution_calculation', to: 'pages#distribution_calculation'
  get 'usefull_links', to: 'pages#usefull_links'

  resources :bill_histories, except: [:index]

  get 'year_average/:year' => "bill_histories#year_average"
  get 'get_bill_history/:month/:year' =>"bill_histories#get_bill_history", as: "get_bill_history"

  resources :loans, except: [:edit, :update]
  resources :loan_payments, only: [:new, :create, :destroy]
  resources :market_products

  get 'add_remove_from_market_list/:id' => "market_products#add_remove_from_list"
  get 'is_default_on_list/:id' => "market_products#change_is_default_on_list" 
  get 'load_default_list/:keep_selected' => "market_products#load_default_list"
  get 'clear_market_list' => "market_products#clear_market_list"

  
  namespace :api do
     post 'apiauth' => "auth#auth"
  end

  mount API::Base, at: "/"

end