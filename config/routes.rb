Rails.application.routes.draw do
  # トップページ
  root 'static_pages#top'
  # 静的ページ
  get '/terms', to: 'static_pages#terms'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/guide', to: 'static_pages#guide'
  # ユーザー登録・ログイン周り
  resources :users, only: %i[new create]
  # プロフィール登録
  resources :profiles, only: %i[new create edit update destroy show]
end
