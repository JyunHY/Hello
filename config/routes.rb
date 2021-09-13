Rails.application.routes.draw do
  # mount ActionCable.server => '/cable'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :api do
    post :upload_image, to: 'utils#upload_image'

    resources :users, only: [] do
      member do
        post :subscribe
      end
    end

    resources :posts do
      member do
        post :like
      end
      resources :comments do
        member do
          post :comlike
        end
      end
    end
  end
  resources :groups

  resources :posts do
    resources :comments , only:[:create]
  end

  resources :users do
    resources :messages , only:[:new, :show, :index, :create]
  end

  

  get '@:username/:post_id', to: 'pages#show', as: 'post_page'
  get '@:username', to: 'pages#user', as: 'user_page'
  get ':group', to: 'groups#show', as: 'group_page'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
