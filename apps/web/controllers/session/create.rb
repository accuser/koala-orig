module Web
  module Controllers
    module Session
      # Endpoint for POST /session
      class Create
        include Web::Action

        params do
          param :user do
            param :email, presence: true
            param :password, presence: true
          end
        end

        private

        attr_reader :email_authenticator

        def initialize(email_authenticator: Koala::Interactors::EmailAuthenticator)
          @email_authenticator = email_authenticator
        end

        public

        def call(params)
          result = email_authenticator.new(params[:user]).call

          if result.success?
            self.current_user = result.user
            redirect_to routes.user_path(id: current_user.id)
          else
            self.status = 422
          end
        end
      end
    end
  end
end
