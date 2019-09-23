Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'contact', to: 'pages#contact', as: :contact
  get 'about', to: 'pages#about', as: :about

  resources :foods
  resources :entries

end
