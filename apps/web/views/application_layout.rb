module Web
  module Views
    # Layout helper for the Web application
    class ApplicationLayout
      include Web::Layout

      # A copyright notice
      #
      # @return [String] the copyright notice
      def copyright_notice
        "Copyright © #{copyright_year}"
      end

      # The current copyright year
      #
      # This is a :reek:UtilityFunction:
      def copyright_year
        Time.now.year
      end

      def link_to_organization
        link_to 'Southwest Koala', 'https://github.com/SouthwestKoala'
      end
    end
  end
end
