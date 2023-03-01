Rails.application.routes.draw do
  # トップページ
  root 'static_pages#top'
  # 静的ページ
  get '/terms', to: 'static_pages#terms'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/guide', to: 'static_pages#guide'
  get '/after_login', to: 'static_pages#after_login'
  get '/friend', to: 'static_pages#friend'

  post 'callback' => 'line_bot#callback'

  # ユーザー登録・ログイン周り
  resource :users, only: %i[edit update]
  resources :users, only: %i[new create]

  # 日焼け止め
  resources :sunscreens, only: %i[index show]
  # タグ
  resources :tags, only: %i[index show]
  # スケジュール
  resources :schedules, only: %i[new create edit update destroy show]
  # admin
  namespace :admin do
    resources :sunscreens
    resources :users
    resources :tags
    resources :schedules
    resources :odekake_types
  end
end
