module Web::Controllers::Users
  class New
    include Web::Action

    def call(params)
    end

    private
      def authenticate
        forbidden unless current_user.nil?
      end
  end
end
