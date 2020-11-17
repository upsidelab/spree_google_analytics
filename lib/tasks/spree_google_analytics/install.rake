namespace :spree_google_analytics do
  desc "Installs Alchemy CMS into your app."
  task :install do
    require "generators/spree_google_analytics/install/install_generator"
    SpreeGoogleAnalytics::Generators::InstallGenerator.start
  end
end