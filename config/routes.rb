Rails.application.routes.draw do

  scope module: :public do
    devise_for :customers, skip: [:passwords,], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :customers, only: [:edit, :show, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, except: [:new, :edit, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, except: [:edit, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :addresses, except: [:new, :show]
  end

  scope module: :admin do
    devise_for :admins, skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
    }
  end

  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:create, :new, :destroy]
    resources :orders, only: [:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
