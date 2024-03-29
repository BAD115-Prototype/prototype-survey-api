require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PrototypeSurveyApi
  class Application < Rails::Application
    config.middleware.use ActionDispatch::Cookies

    # Initialize configuration defaults for originally generated Rails version.
    if 'true'===ENV['SSL']
      config.middleware.use ActionDispatch::Session::CookieStore, same_site: :none
      config.force_ssl = true
    else
      config.middleware.use ActionDispatch::Session::CookieStore
    end

    config.action_mailer.delivery_method = :smtp
      config.action_mailer.smtp_settings = {
        address: 'smtp.office365.com',
        port: 587,
        domain: ENV['DOMAIN'],
        user_name: ENV['MAIL'],
        password: ENV['MAILPASS'],
        authentication: :login,
        enable_starttls_auto: true
      }

    config.load_defaults 7.0
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = false
  end
end
