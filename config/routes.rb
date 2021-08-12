Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :groups

  resources :posts do
    resources :comments , only:[:create]
  end

  get '@:username/:post_id', to: 'pages#show', as: 'post_page'
  get '@:username', to: 'pages#user', as: 'user_page'
  get ':group', to: 'groups#show', as: 'group_page'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
