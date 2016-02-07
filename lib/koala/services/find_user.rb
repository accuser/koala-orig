module Koala
  module Services
    class FindUser
      include Koala::Service

      def initialize(repository: UserRepository)
        @repository = repository
      end
      
      def call(params)
        @repository.find(params[:id])
      end
    end
  end
end
