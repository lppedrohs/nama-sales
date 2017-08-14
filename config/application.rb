require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NameSales
  class Application < Rails::Application
    config.load_defaults 5.1

    config.i18n.default_locale = :'pt-BR'
    config.i18n.enforce_available_locales = false

    console { ActiveRecord::Base.connection }

    config.generators.fixture_replacement :factory_girl, dir: "spec/factories"
    config.generators.test_framework :rspec, controller_specs: false, view_specs: false, routing_specs: false, model_specs: false
  end
end
