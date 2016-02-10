module Koala
  module Services
    class ChangePassword
      private
      attr_reader :user, :repository

      def initialize(user, repository: UserRepository)
        @user = user
        @repository = repository
      end

      public
      def call(params)
        if user.password == params[:password]
          repository.update(user.id, password: params[:new_password])
        end
      end
    end
  end
end
