module Web::Controllers::Users
  class Create
    include Web::Action

    params do
      param :user do
        param :email, presence: true
        param :password, presence: true
      end
    end

    def initialize(register_user: Koala::Services::RegisterUser)
      @register_user = register_user
    end

    def call(params)
      if params.invalid?
        halt 400
      elsif @user = @register_user.call(params[:user])
        redirect_to routes.user_path(@user.id)
      else
        halt 422
      end
    end
  end
end
