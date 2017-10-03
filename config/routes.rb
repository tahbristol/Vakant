Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {sessions: 'users/sessions'}
  devise_for :organizations, path: 'organizations', controllers: {sessions: "organizations/sessions"}


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :job_applications, only: [:new, :create, :show, :edit, :update]
  resources :users, only: [:index, :show]
  resources :organizations, only: [:index, :show]
  get 'organizations/:id/jobs', to: 'organizations#jobs'
  resources :jobs
  root 'welcome#index'

  devise_scope :user do
    get 'sign_up_seeker', to: 'devise/registrations#new'
  end

  devise_scope :organization do
    get 'sign_up_org', to: 'devise/registrations#new'
  end

  end
