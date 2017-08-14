require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sales
  class Application < Rails::Application
    config.load_defaults 5.1

    config.assets.quiet = true

    console { ActiveRecord::Base.connection }

    config.generators.fixture_replacement :factory_girl, dir: "spec/factories"
    config.generators.test_framework :rspec, controller_specs: false, view_specs: false, routing_specs: false, model_specs: false
  end
end
