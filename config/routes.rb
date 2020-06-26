Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'distribution_calculation', to: 'pages#distribution_calculation'

  resources :bill_histories

  get 'year_average/:year' => "bill_histories#year_average"
  get 'get_bill_history/:month/:year' =>"bill_histories#get_bill_history"

  resources :loans, except: [:edit, :update]
  resources :loan_payments
end