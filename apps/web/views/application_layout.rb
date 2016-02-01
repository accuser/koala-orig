module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def copyright_notice
        "Copyright © #{copyright_year}"
      end

      def copyright_year
        Time.now.year
      end
  
      def link_to_organization
        link_to 'Southwest Koala', 'https://github.com/SouthwestKoala'
      end
    end
  end
end
