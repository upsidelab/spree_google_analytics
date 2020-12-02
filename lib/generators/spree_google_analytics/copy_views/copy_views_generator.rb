module SpreeGoogleAnalytics
  module Generators
    class CopyViewsGenerator < Rails::Generators::Base
      source_root Engine.root

      def copy_view_files
        directory 'app/views'
      end
    end
  end
end
