module Web::Controllers::Session
  class Create
    include Web::Action

    params do
      param :user do
        param :email, presence: true
        param :password, presence: true
      end
    end

    private
    attr_reader :authenticate_user

    def initialize(authenticate_user: Koala::Services::AuthenticateUser)
      @authenticate_user = authenticate_user
    end

    public
    def call(params)
      if params.invalid?
        self.status = 400
      elsif self.current_user = authenticate_user.call(params[:user])
        redirect_to routes.user_path(id: current_user.id)
      else
        self.status = 422
      end
    end
  end
end
