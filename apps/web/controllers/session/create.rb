module Web::Controllers::Session
  class Create
    include Web::Action

    params do
      param :user do
        param :email, presence: true
        param :password, presence: true
      end
    end

    def initialize(sign_in: Koala::Services::SignIn)
      @sign_in = sign_in
    end

    def call(params)
      if params.invalid?
        halt 400
      elsif self.current_user = @sign_in.call(params[:user])
        redirect_to routes.user_path(id: current_user.id)
      else
        halt 422
      end
    end
  end
end
