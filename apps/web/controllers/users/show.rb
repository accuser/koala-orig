module Web
  module Controllers
    module Users
      # Endpoint for GET /users/:id
      class Show
        include Web::Action

        expose :user

        private

        attr_reader :user_repository

        def initialize(user_repository: UserRepository)
          @user_repository = user_repository
        end

        public

        def call(params)
          unless @user = user_repository.find(params[:id])
            halt 404
          end
        end
      end
    end
  end
end
