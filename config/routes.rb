require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  root to: "pages#index"
  # resources :contact_submissions, only: [:new, :create]

  post '/', to: 'contact_submissions#create', as: 'form_submission', defaults: { format: 'js' }
end
