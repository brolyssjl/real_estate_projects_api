Rails.application.routes.draw do
  get 'projects/index'
  get 'projects/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end
