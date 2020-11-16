require 'spree_core'
require 'spree_extension'
require 'spree_google_analytics/engine'
require 'spree_google_analytics/version'

module SpreeGoogleAnalytics
  class << self
    def webpacker
      @webpacker ||= ::Webpacker::Instance.new(
          root_path: SpreeGoogleAnalytics::Engine.root,
          config_path: SpreeGoogleAnalytics::Engine.root.join('config', 'webpacker.yml')
      )
    end
  end
end