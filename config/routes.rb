Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :job_applications, only: [:new, :create, :show]
  resources :organizations
  root 'welcome#index'

  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end


  end
