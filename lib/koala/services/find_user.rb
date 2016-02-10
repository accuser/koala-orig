module Koala
  module Services
    class FindUser
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
        repository.find(params[:id])
      end
    end
  end
end
