require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
# 上記の設定後、ユーザー登録・ログインに失敗した際のエラーメッセージが以下のような表示となりますが、カリキュラム上の仕様として問題ありません。
# config.i18n.default_locale = :jaの記述により、アプリのデフォルトの言語設定が日本語となり、deviseのエラーメッセージも日本語化するよう求められるためです。
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
