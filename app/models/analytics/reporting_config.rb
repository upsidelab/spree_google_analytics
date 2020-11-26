module Analytics
  class ReportingConfig
    class << self
      def analytics_access_token
        scope = 'https://www.googleapis.com/auth/analytics.readonly'
        authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
            json_key_io: File.open(json_key_path),
            scope: scope
        )

        authorizer.fetch_access_token!
      end

      def analytics_view_id
        ENV.fetch('GOOGLE_ANALYTICS_VIEW_ID')
      end

      private

      def json_key_path
        ENV.fetch('GOOGLE_ANALYTICS_SERVICE_ACCOUNT_JSON_PATH')
      end
    end
  end
end