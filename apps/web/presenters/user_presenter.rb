module Web
  module Presenters
    class UserPresenter
      include Hanami::Presenter

      def email_url
        "mailto:#{email}"
      end
    end
  end
end
