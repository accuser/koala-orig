require 'hanami/interactor'

module Koala
  module Interactors
    # Authenticate the user with an authentication token
    #
    # @example
    #
    #   result = Koala::Interactors::TokenAuthenticator(token: session[:token])
    #   result.success? # => true
    #   result.user # => #<User:0x007fd76010e9a8 @id=42 @auth_token='cb0G9HtuQrICPI39RXJoig'>
    #
    class TokenAuthenticator
      include Hanami::Interactor

      expose :user

      private

      attr_reader :user_repository

      def initialize(params, user_repository: UserRepository)
        @token = params[:token]
        @user_repository = user_repository
      end

      public

      def call
        authenticate_by_token
      end

      private

      def authenticate_by_token
        user = user_repository.user_with_token(@token)

        if user
          @user = user
        else
          error :invalid_token
        end
      end

      def valid?
        @token
      end
    end
  end
end
