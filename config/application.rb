require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GeniusLounge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.


    config.load_defaults 5.2
    config.api_only = true
    config.app_generators.scaffold_controller :responders_controller
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Middleware for ActiveAdmin
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Flash
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.exceptions_app = self.routes
    config.eager_load_paths = Dir.glob("#{Rails.root}/app/*").reject do |path|
      path.include?("admin_user")
    end

  end
end
