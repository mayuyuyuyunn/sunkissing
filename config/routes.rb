Rails.application.routes.draw do
  # トップページ
  root 'static_pages#top'
  # 静的ページ
  get '/terms', to: 'static_pages#terms'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/after_login', to: 'static_pages#after_login'
  get '/friend', to: 'static_pages#friend'
  get '/calendar', to: 'static_pages#calendar'

  post 'callback' => 'line_bot#callback'

  # ユーザー登録・ログイン周り
  resource :user, only: %i[new create edit update]
  resources :users, only: %i[create new]
  # 日焼け止め
  resources :sunscreens do
    collection do
      get 'search'
    end
  end
  resources :sunscreens, only: %i[index show]
  # タグ
  resources :tags, only: %i[index show]
  # スケジュール
  resources :schedules, only: %i[new create destroy show]
  # 天気予報
  resource :weather_forecast, only: %i[show]
  # admin
  namespace :admin do
    root 'dashboards#index'
    resources :sunscreens
    resources :users
    resources :tags
    resources :schedules
    resources :odekake_types
    resources :dashboards
  end
  # error
  get '*path', to: 'application#render_404'
end
