Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  root to: 'items#index'
  resources :users
  resources :items do
    resources :messages, only:[:new, :create]
    resources :orders, only:[:new, :create, :edit ,:update ,:destroy]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }

    member do
      get :order 
    end
    resources :messages, only:[:create, :new]
    resources :orders, only:[:new, :create, :edit ,:update ,:destroy,] do
      collection do
        post 'pay', to: 'orders#pay'
        get 'done', to: 'orders#done'
      end
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'up', to: 'cards#up'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
 