module Koala
  module Services
    class AuthenticateUser
      def self.call(params)
        new.call(params)
      end

      private
      attr_reader :repository

      def initialize(repository: UserRepository)
        @repository = repository
      end

      public
      def call(params)
        user = repository.user_with_email(params[:email])

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
