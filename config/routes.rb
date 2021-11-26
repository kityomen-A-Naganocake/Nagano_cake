Rails.application.routes.draw do

  scope module: :public do
    
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'

    resources :customers, only: [:update]
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, except: [:new, :edit, :show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, except: [:edit, :update, :destroy]
    resources :addresses, except: [:new, :show]
     devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

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
    # resources :order_detail, only: [:update]
    patch 'order_update/:id' => 'order_details#update', as: 'order_detail'
    resources :orders, only: [:index, :show, :destroy, :update]
    
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
