Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {sessions: 'users/sessions'}
  devise_for :organizations, path: 'organizations', controllers: {sessions: "organizations/sessions"}


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :job_applications, only: [:new, :create, :show]

  root 'welcome#index'

  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end



  end
