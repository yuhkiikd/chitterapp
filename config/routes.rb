Rails.application.routes.draw do
  root 'chitters#index'
  resources :chitters
end
