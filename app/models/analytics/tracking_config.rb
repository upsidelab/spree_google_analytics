module Analytics
  class TrackingConfig
    class << self
      def enabled?
        tracking_id.present?
      end

      def client(client_id = nil)
        Staccato.tracker(tracking_id, client_id)
      end

      private

      def tracking_id
        ENV['GOOGLE_ANALYTICS_TRACKING_ID']
      end
    end
  end
end
