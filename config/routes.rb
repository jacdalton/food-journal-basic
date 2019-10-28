Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'contact', to: 'pages#contact', as: :contact
  get 'about', to: 'pages#about', as: :about
  get 'calculator', to: 'pages#calculator', as: :calculator

  resources :foods
  resources :entries do
    member do
      delete 'remove_food', to: 'entries#remove_food'
    end
  end

  resources :calorie_goals, only: [:index, :new, :create]
  get 'show_goal', to: 'calorie_goals#show_goal', as: :show_goal

end
