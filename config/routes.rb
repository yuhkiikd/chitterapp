Rails.application.routes.draw do
  root 'chitters#index'
  resources :chitters, expect: [:show] do
    collection do
      post :confirm
      get :confirm
    end
  end
end
