Rails.application.routes.draw do
  get 'health_check', to: 'health#health_check'
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'projects#index'
end
