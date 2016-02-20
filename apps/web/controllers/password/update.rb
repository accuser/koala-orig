module Web
  module Controllers
    module Password
      # Endpoint for PATCH /password
      class Update
        include Web::Action

        params do
          param :password do
            param :password, presence: true
            param :new_password, presence: true, confirmation: true
          end
        end

        private

        attr_reader :password_updater

        def initialize(password_updater: Koala::Interactors::PasswordUpdater)
          @password_updater = password_updater
        end

        public

        def call(params)
          result = password_updater.new(current_user, params[:password]).call

          if result.success?
            redirect_to routes.user_path(current_user.id)
          else
            self.status = 422
          end
        end
      end
    end
  end
end
