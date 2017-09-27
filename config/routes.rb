Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :job_applications, only: [:new, :create, :show]
  root 'welcome#index'
  end
