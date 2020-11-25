Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :analytics, only: [:index] do
      collection do
        Spree::Admin::AnalyticsController.available_reports.each do |name|
          get name
        end
      end
    end
  end
end
