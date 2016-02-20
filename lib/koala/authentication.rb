module Koala
  # Authentication module for actions
  module Authentication
    def self.included(action)
      action.class_eval do
        expose :current_user
      end
    end

    AUTH_KEY = :auth

    private

    # @api private
    # @see #current_user
    def _authenticated_user
      result = Koala::Interactors::TokenAuthenticator.new(token: session[AUTH_KEY]).call
      result.user if result.success?
    end

    # Get the currently authenticated user
    #
    # @return [User] the currently authenticated user
    def current_user
      @current_user ||= _authenticated_user
    end

    # Set the currently authenticated user
    #
    # @param user [User] the currently authenticated user
    #
    # @example Signing a User in
    #
    #   self.current_user = AuthenticateUser(email: 'alice@example.com', password: 'password')
    #
    # @example Signing a User out
    #
    #   self.current_user = nil
    #
    def current_user=(user)
      session[AUTH_KEY] = user&.auth_token
      @current_user = user
    end
  end
end
