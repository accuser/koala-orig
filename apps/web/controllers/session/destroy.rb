module Web::Controllers::Session
  class Destroy
    include Web::Action

    def call(params)
      self.current_user = nil
    end

    private
      def authenticate
        # do nothing
      end
  end
end
