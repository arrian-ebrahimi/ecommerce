Rails.application.routes.draw do
  root to: 'code#index'
  resources :code

end
