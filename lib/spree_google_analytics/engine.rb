module SpreeGoogleAnalytics
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_google_analytics'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.app_middleware.use(
        Rack::Static,
        # note! this varies from the Webpacker/engine documentation
        urls: ["/spree-google-analytics-packs"], root: SpreeGoogleAnalytics::Engine.root.join("public")
        # instead of -> urls: ["/saddlebag-packs"], root: "saddlebag/public"
    )

    config.to_prepare(&method(:activate).to_proc)

    initializer "webpacker.proxy" do |app|
      insert_middleware = begin
                            SpreeGoogleAnalytics.webpacker.config.dev_server.present?
                          rescue
                            nil
                          end
      next unless insert_middleware

      app.middleware.insert_before(
          0, Webpacker::DevServerProxy, # "Webpacker::DevServerProxy" if Rails version < 5
          ssl_verify_none: true,
          webpacker: SpreeGoogleAnalytics.webpacker
      )
    end
  end
end
