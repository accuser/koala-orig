module Web
  module Controllers
    module Authentication
      def self.included(action)
        action.class_eval do
          expose :current_user
        end
      end

      private
        def authenticate
          unauthorized if current_user.nil?
        end

        def current_user
          @current_user ||= UserRepository.user_with_token(token)
        end

        def current_user=(user)
          if user.nil?
            session[:token] = nil
          else
            session[:token] = user.token
          end

          @current_user = user
        end

        def forbidden
          halt 403
        end

        def token
          session[:token]
        end

        def unauthorized
          halt 401
        end
    end
  end
end
