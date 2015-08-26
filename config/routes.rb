Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'

  resources :projects, except: [:show] do
    resources :tasks
  end
end