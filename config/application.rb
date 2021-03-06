require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bicycle
  class Application < Rails::Application
    config.generators do |generate|
      generate.test_framework :rspec,
        fixtures: true,      view_specs: false,
        helper_specs: true,  routing_specs: true,
        request_specs: true
      generate.integration_tool :rspec, :fixture => true, :views => true
      generate.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
