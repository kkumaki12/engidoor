require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EngineerQA
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.api_only = true

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Permit cross origin
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 methods: %i[get post delete options head put]
      end
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
