require "webpacker/helper"

module SpreeGoogleAnalytics
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      SpreeGoogleAnalytics.webpacker
    end
  end
end