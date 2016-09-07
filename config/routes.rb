Rails.application.routes.draw do
  root 'courses#index'
  resources :courses do
    resources :lessons
  end
  resources :lessons do
    resources :sections
  end
end
