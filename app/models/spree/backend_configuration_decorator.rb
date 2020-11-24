module Spree
  BackendConfiguration.class_eval do
    ANALYTICS_TABS ||= [:analytics]
  end
end