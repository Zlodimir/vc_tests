require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VcTests
  class Application < Rails::Application
    config.angular_templates.module_name     = 'vc_tests'
    config.angular_templates.html_compressor = false
    config.angular_templates.ignore_prefix   = 'frontend/angular/templates/'
    config.autoload_paths << Rails.root.join('lib')
  end
end
