module Web::Controllers::Users
  class Create
    include Web::Action

    params do
      param :user do
        param :email, presence: true
        param :password, presence: true
      end
    end

    private
    attr_reader :register_user

    def initialize(register_user: Koala::Services::RegisterUser)
      @register_user = register_user
    end

    public
    def call(params)
      if params.invalid?
        self.status = 400
      elsif @user = register_user.call(params[:user])
        redirect_to routes.user_path(@user.id)
      else
        self.status = 422
      end
    end
  end
end
