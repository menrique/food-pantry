require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Making sure we load .env variables sooner enough
Dotenv::Railtie.load if defined? Dotenv::Railtie

module FoodPantry
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Use Sidekiq as Active Job adapter
    config.active_job.queue_adapter = :sidekiq

    # Use rspec and factory bot
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: './spec/factories'
      g.factory_bot suffix: 'factory'
    end

    # https://blog.bigbinary.com/2016/02/15/rails-5-makes-belong-to-association-required-by-default.html
    config.active_record.belongs_to_required_by_default = false
  end
end
