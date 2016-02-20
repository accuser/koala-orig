require 'hanami/interactor'

module Koala
  module Interactors
    # Register a new user
    #
    # @example
    #
    #   result = Koala::Interactors::UserCreator.new(email: 'alice@example.com', password: 'password').call
    #   result.success? # => true
    #   result.user # => #<User:0x007fd76010e9a8 @id=42 @email='alice@example.com'>
    #
    class UserCreator
      include Hanami::Interactor

      expose :user

      private

      attr_reader :user_repository

      def initialize(params, user_repository: UserRepository)
        @email, @password = params.values_at(:email, :password)
        @user_repository = user_repository
      end

      public

      # Create a new user
      def call
        @user = user_repository.create(User.new(email: @email, password: @password))
      end

      private

      def valid?
        @email && @password
      end
    end
  end
end
