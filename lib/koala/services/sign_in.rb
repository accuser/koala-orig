module Koala
  module Services
    class SignIn
      include Koala::Service

      def initialize(repository: UserRepository)
        @repository = repository
      end
      
      def call(params)
        user = @repository.user_with_email(params[:email])

        if user.nil?
          nil
        elsif user.password == params[:password]
          user
        else
          nil
        end
      end
    end
  end
end
