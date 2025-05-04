Rails.application.routes.draw do
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

  # cart_items
  # get 'cart_items/index' ここから作業


  namespace :admin do
    get 'orders/show'
  
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  
    get 'genres/index'
    get 'genres/edit'
  
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  
    get 'homes/top'
  end

  namespace :public do
    # homes
    # 最上部に記述




    # orders
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'

    # addresses
    get 'addresses/index'
    get 'addresses/edit'
  end

  # 顧客側のURL変更
  devise_for :customers, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者側のURL変更
  devise_for :admins, skip: [:password, :registrations], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
