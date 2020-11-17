namespace :spree_google_auth do
  desc "Installs Alchemy CMS into your app."
  task :install do
    require "generators/spree_google_analytics/install/install_generator"
    SpreeGoogleAnalytics::Generators::InstallGenerator.start
  end
end