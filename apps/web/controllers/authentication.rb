module Web
  module Controllers
    module Authentication
      def self.included(action)
        action.class_eval do
          expose :current_user
        end
      end

      private
        def auth_token
          session[:token]
        end

        def auth_token=(token)
          session[:token] = token

          @current_user = nil
        end

        def current_user
          @current_user ||= UserRepository.user_with_token(auth_token)
        end

        def current_user=(user)
          if user.nil?
            self.auth_token = nil
          else
            self.auth_token = user.auth_token
          end

          @current_user = user
        end
    end
  end
end
