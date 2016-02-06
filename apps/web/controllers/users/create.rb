module Web::Controllers::Users
  class Create
    include Web::Action

    params do
      param :user do
        param :email, presence: true
        param :password, presence: true
      end
    end

    def initialize(repository: UserRepository)
      @repository = repository
    end

    def call(params)
      if params.invalid?
        halt 400
      elsif @user = @repository.create(User.new(params[:user]))
        redirect_to routes.user_path(@user.id)
      else
        halt 422
      end
    end

    private
      def authenticate
        forbidden unless current_user.nil?
      end
  end
end
