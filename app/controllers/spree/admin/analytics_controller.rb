module Spree
  module Admin
    class AnalyticsController < Spree::Admin::BaseController
      class << self
        def available_reports
          @@available_reports ||= []
        end

        private

        def add_report(name)
          @@available_reports ||= []
          @@available_reports << name
          define_method name.to_sym do; end
        end
      end

      before_action :set_ga_config

      add_report :products
      add_report :categories

      def index
        @reports = AnalyticsController.available_reports
      end

      private

      def set_ga_config
        @ga_token = Analytics::ReportingConfig.analytics_access_token['access_token']
        @ga_view_id = Analytics::ReportingConfig.analytics_view_id
      end
    end
  end
end
