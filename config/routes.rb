# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :employees do
        resources :employee_survey_responses, only: [ :index, :create, :update ]
      end
      get 'dashboard', to: 'dashboard#show'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :employees, only: [ :index, :show ]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "employees#index"
  # Dashboard
  get 'dashboard', to: 'dashboard#index'
end
