module Koala
  module Services
    class RegisterUser
      include Koala::Service

      def initialize(repository: UserRepository)
        @repository = repository
      end

      def call(params)
        @repository.create(User.new(params))
      end
    end
  end
end
