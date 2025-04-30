Rails.application.routes.draw do
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
