Rails.application.routes.draw do
  root 'department#index'

  resources :departments
end
