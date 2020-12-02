namespace :spree_google_analytics do
  desc "Copies Spree Google Analytics view files into your app."
  task :copy_views do
    require "generators/spree_google_analytics/copy_views/copy_views_generator"
    SpreeGoogleAnalytics::Generators::CopyViewsGenerator.start
  end
end
