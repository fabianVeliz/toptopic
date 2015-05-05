require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Toptopic
  class Application < Rails::Application
    config.serve_static_assets = true
    config.generators do |g|
      g.template_engine :slim

      g.test_framework :rspec, fixture: true
      g.view_specs   = false
      g.helper_specs = false
      g.stylesheets  = false
      g.javascripts  = false
      g.helper       = false
    end
  end
end
