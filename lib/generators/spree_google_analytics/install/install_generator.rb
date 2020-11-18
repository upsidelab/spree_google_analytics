module SpreeGoogleAnalytics
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :migrations, type: :boolean, default: true
      class_option :auto_run_migrations, type: :boolean, default: false
      class_option :skip_webpacker_installer,
                   type: :boolean,
                   default: false,
                   desc: "Skip running the webpacker installer."

      source_root File.expand_path("files", __dir__)

      def add_migrations
        return unless options[:migrations]
        run 'bundle exec rake railties:install:migrations FROM=spree_google_analytics'
      end

      def run_migrations
        return unless options[:migrations]
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask('Would you like to run the migrations now? [Y/n]'))
        if run_migrations
          run 'bundle exec rails db:migrate'
        else
          puts 'Skipping rails db:migrate, don\'t forget to run it!'
        end
      end

      def run_webpacker_installer
        return if options[:skip_webpacker_installer]
        # Webpacker does not create a package.json, but we need one
        unless File.exist? app_root.join("package.json")
          in_root { run "echo '{}' > package.json" }
        end
        rake("webpacker:install", abort_on_failure: true)
      end

      def add_npm_package
        run "yarn add spree_google_analytics"
      end

      def copy_alchemy_entry_point
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
