Rails.application.routes.draw do
  root 'chitters#index'
  resources :chitters, except: [:show, :new] do
    collection do
      post :confirm
      get :confirm
    end
  end
end