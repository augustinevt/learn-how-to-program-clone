Rails.application.routes.draw do
  root 'courses#index'
  resources :courses do
    resources :lessons do
      get 'next', on: :member
    end
  end
end
