namespace :spree_google_analytics do
  desc "Installs Spree Google Analytics into your app."
  task :install do
    require "generators/spree_google_analytics/install/install_generator"
    from = ARGV.find_index('--') || 0
    args = ARGV[Range.new(from+1, -1)]
    SpreeGoogleAnalytics::Generators::InstallGenerator.start(args)
  end
end