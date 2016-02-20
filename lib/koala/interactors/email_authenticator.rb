require 'hanami/interactor'

module Koala
  module Interactors
    # Authenticate the user with an email and password
    #
    # @example
    #
    #   result = Koala::Interactors::EmailAuthenticator.new(email: 'alice@example.com', password: 'password').call
    #   result.success? # => true
    #   result.user # => #<User:0x007fd76010e9a8 @id=42 @email='alice@example.com'>
    #
    class EmailAuthenticator
      include Hanami::Interactor

      expose :user

      private

      attr_reader :user_repository

      def initialize(params, user_repository: UserRepository)
        @email, @password = params.values_at(:email, :password)
        @user_repository = user_repository
      end

      public

      def call
        authenticate_by_email_and_password
      end

      private

      def authenticate_by_email_and_password
        user = user_repository.user_with_email(@email)

        if user && user&.password == @password
          @user = user
        else
          error :invalid_email_or_password
        end
      end

      def valid?
        @email && @password
      end
    end
  end
end
