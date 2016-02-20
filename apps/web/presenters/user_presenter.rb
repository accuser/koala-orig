module Web
  module Presenters
    # Presentation helper for User entities
    #
    # @see User
    class UserPresenter
      include Hanami::Presenter

      def email_url
        "mailto:#{email}"
      end

      # The user's full name
      #
      # @return [String] the user's full name
      def full_name
        names.compact.join
      end

      # The user's initials
      #
      # @return [String] the user's initials
      def initials
        names.compact.map(:first).upcase
      end

      private
      def names
        [ first_name, last_name ].compact
      end
    end
  end
end
