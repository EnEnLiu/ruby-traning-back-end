require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Training5x
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = "zh-TW"
    # config.generators do |g| 
    #   g.test_framework :rspec,
    #   g.fixture_replacement :factory_bot,
    #   view_specs: false, 
    #   helper_specs: false, 
    #   routing_specs: false, 
    #   request_specs: false
    # end
    config.generators do |g|
      g.factory_bot false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

