module Analytics
  class TrackingConfig
    class << self
      def enabled?
        tracking_id.present?
      end

      def client
        Staccato.tracker(tracking_id, client_id)
      end

      private

      def tracking_id
        ENV['GOOGLE_ANALYTICS_TRACKING_ID']
      end

      def client_id
        ENV['GOOGLE_ANALYTICS_CLIENT_ID']
      end

      def ecommerce_currency
        ENV['GOOGLE_ANALYTICS_CURRENCY']
      end
    end
  end
end
