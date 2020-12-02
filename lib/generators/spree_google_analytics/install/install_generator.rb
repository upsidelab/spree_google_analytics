module SpreeGoogleAnalytics
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :skip_webpacker_installer,
                   type: :boolean,
                   default: false,
                   desc: "Skip running the webpacker installer."

      source_root File.expand_path("files", __dir__)

      def run_webpacker_installer
        return if options[:skip_webpacker_installer]
        # Webpacker does not create a package.json, but we need one
        unless File.exist? app_root.join("package.json")
          in_root { run "echo '{}' > package.json" }
        end
        rake("webpacker:install:vue", abort_on_failure: true)
      end

      def remove_webpacker_initial_files
        return if options[:skip_webpacker_installer]

        File.delete("#{Webpacker.config.source_entry_path}/hello_vue.js")
        File.delete("#{Webpacker.config.source_path}/app.vue")
      end

      def add_npm_package
        run "yarn add spree_google_analytics"
      end

      def copy_js_entry_point
        webpack_config = YAML.load_file(app_root.join("config", "webpacker.yml"))[Rails.env]
        copy_file "spree_google_analytics.js",
                  app_root.join(webpack_config["source_path"], webpack_config["source_entry_path"], "spree_google_analytics.js")
      end

      def precompile_assets
        rake("assets:precompile", abort_on_failure: true)
      end

      private

      def app_root
        @_app_root ||= Rails.root
      end
    end
  end
end
