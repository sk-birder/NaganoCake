Rails.application.routes.draw do
  # 顧客側
  # public/homes ルートディレクトリの設定を兼ねる
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  # public/items
  resources :items, only: [:index, :show], controller: 'public/items'

  # public/customers
  # resourcesではなくresourceを使う(:idを扱わないため)
  namespace :customers do
    resource :my_page, only: [:show, :edit, :update], controller: '/public/customers'
    get 'my_page/confirm' => '/public/customers#confirm'
    patch 'my_page' => '/public/customers#withdraw'
  end

  # public/cart_items
  resources :cart_items, only: [:create, :index, :update, :destroy], controller: 'public/cart_items'
  delete 'cart_items' => 'public/cart_items#destroy_all'

  # public/orders
  resources :orders, only: [:create, :index, :show, :new], controller: 'public/orders'
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'

  # public/addresses
  resources :addresses, only: [:create, :index, :update, :destroy, :edit], controller: 'public/addresses'

  # Devise 顧客側URL変更
  devise_for :customers, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  

  # 管理者側
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:create, :index, :show, :update, :edit, :new]
    resources :genres, only: [:create, :index, :update, :edit]
    resources :customers, only: [:index, :show, :update, :edit]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # Devise 管理者側URL変更
  devise_for :admins, skip: [:password, :registrations], controllers: {
    sessions: "admin/sessions"
  }
end
