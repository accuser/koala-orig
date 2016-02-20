require 'hanami/interactor'

module Koala
  module Interactors
    # Changes the user's password
    #
    # @example
    #
    #   result = PasswordUpdater.new(current_user, { password: 'password', new_password: 'secret ' })
    #   result.success? # => true
    #
    class PasswordUpdater
      include Hanami::Interactor

      expose :user

      private

      attr_reader :user_repository
      
      def initialize(user, params, user_repository: UserRepository)
        @user = user
        @password, @new_password = params.values_at(:password, :new_password)
        @user_repository = user_repository
      end

      public

      def call
        user_repository.update(@user.id, password: @new_password)
      end

      private

      def valid?
        @user && @user.password == @password
      end
    end
  end
end
