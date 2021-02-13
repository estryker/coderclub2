# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
# I don't know what this does. after downgrade to rails 6 and removing webpack, this fails: Rails.application.load_server
