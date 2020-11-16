require "webpacker/helper"

module Spree
  module Admin
    module AnalyticsHelper
      include ::Webpacker::Helper

      def current_webpacker_instance
        SpreeGoogleAnalytics.webpacker
      end
    end
  end
end