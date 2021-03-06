Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_for :organizations, path: 'organizations', controllers: {sessions: "organizations/sessions"}


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :job_applications, only: [:new, :create, :show, :edit, :update]
  resources :users, only: [:new, :index, :show, :edit, :update]
  resources :organizations, only: [:index, :show, :edit, :update]
  resources :jobs
  resources :profiles


  get 'organizations/:id/jobs', to: 'organizations#jobs'

  resources :jobs do
    resources :users, only: [:index]
  end
  resources :organizations do
    resources :jobs
  end
  post 'jobs/:id/apply', to: 'jobs#apply'

  root 'welcome#index'


  end
