module Koala
  module Services
    class RegisterUser
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
        repository.create(User.new(params))
      end
    end
  end
end
