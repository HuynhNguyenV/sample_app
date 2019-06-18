require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = Settings.time_zone

    config.time_zone = "Eastern Time (US & Canada)"

    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
