module Koala
  module Service
    def self.included(service)
      service.class_eval do
        include ClassMethods
      end
    end

    module ClassMethods
      def call(params)
        new.call(params)
      end
    end
  end
end
