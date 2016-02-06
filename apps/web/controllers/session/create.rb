module Web::Controllers::Session
  class Create
    include Web::Action
    
    params do
      param :session do
        param :email, presence: true
        param :password, presence: true
      end
    end

    def initialize(repository: UserRepository)
      @repository = repository
    end

    def call(params)
      halt 400 if params.invalid?

      self.current_user = @repository.user_with_email(params[:session])

      if current_user
        redirect_to routes.user_path(id: current_user.id)
      else
        halt 404
      end
    end
  end
end
