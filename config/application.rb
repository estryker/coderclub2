require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Coderclub2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    # because of error on heroku:  /app/vendor/bundle/ruby/2.7.0/gems/zeitwerk-2.4.2/lib/zeitwerk/loader/callbacks.rb:18:in `on_file_autoloaded': expected file /app/app/opal/opal_web_worker_loader.rb to define constant OpalWebWorkerLoader, but didn't (Zeitwerk::NameError)
    # solution here: https://stackoverflow.com/questions/57277351/rails-6-zeitwerknameerror-doesnt-load-class-from-module
    config.autoloader = :classic
  end
end
