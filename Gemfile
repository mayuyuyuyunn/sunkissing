source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
#gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# CSS、JSバンドラー
gem 'cssbundling-rails'
gem 'jsbundling-rails'

# 日本語化
gem 'rails-i18n'
gem 'enum_help'

# LINE API
gem 'line-bot-api'

# DBのスキーム表示
gem 'annotate'

# 環境変数の管理
gem 'dotenv-rails'

# 日付関連のバリデーション
gem 'validates_timeliness', '~> 7.0.0.beta1'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # RSpec関連
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'capybara'
  gem 'webdrivers'
  # デバッグ
  gem 'pry-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Lintチェック
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rails_best_practices', '~> 1.23', '>= 1.23.2'
  gem 'rubocop-performance'
  gem 'rubocop-rubycw'
  # N+1問題解決してくれる便利な子
  gem 'bullet'
  # エラー画面整形
  gem 'better_errors'
  gem 'binding_of_caller'
end

