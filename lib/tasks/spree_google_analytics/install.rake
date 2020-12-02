namespace :spree_google_analytics do
  desc "Installs Spree Google Analytics into your app."
  task :install do
    require "generators/spree_google_analytics/install/install_generator"
    SpreeGoogleAnalytics::Generators::InstallGenerator.start
  end
end