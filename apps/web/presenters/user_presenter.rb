module Web
  module Presenters
    class UserPresenter
      include Hanami::Presenter

      def email
        super.downcase
      end

      def email_url
        "mailto:#{email}"
      end
    end
  end
end
