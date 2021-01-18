Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  resources :posts do
    resources :comments
  end
end
