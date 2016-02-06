module Web::Controllers::Users
  class Show
    include Web::Action

    params do
      param :id, presence: true
    end

    expose :user

    def initialize(repository: UserRepository)
      @repository = repository
    end

    def call(params)
      if params.invalid?
        halt 400
      elsif @user = @repository.find(params[:id])
        # do nothing
      else
        halt 404
      end
    end
  end
end
