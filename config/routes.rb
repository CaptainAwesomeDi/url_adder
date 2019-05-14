Rails.application.routes.draw do
  resources :post, only:[:index,:new,:create,:show] do
    resources :comment, only:[:new,:create,:show]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
