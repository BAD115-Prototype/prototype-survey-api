#config/initializers/cookie_serailizer.rb
Rails.application.config.action_dispatch.cookies_serializer = :hybrid
#config/initializers/session_store.rb
Rails.application.config.session_store :cookie_store, key: '_authentication_app'