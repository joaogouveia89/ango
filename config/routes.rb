Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", sessions: 'users/sessions' }, path: 'auth', path_names: {}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'distribution_calculation', to: 'pages#distribution_calculation'

  resources :bill_histories, except: [:index]

  get 'year_average/:year' => "bill_histories#year_average"
  get 'get_bill_history/:month/:year' =>"bill_histories#get_bill_history"

  resources :loans, except: [:edit, :update]
  resources :loan_payments, only: [:new, :create, :destroy]

end