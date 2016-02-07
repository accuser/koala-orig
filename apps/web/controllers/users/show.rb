module Web::Controllers::Users
  class Show
    include Web::Action

    params do
      param :id, presence: true
    end

    expose :user

    def initialize(find_user: Koala::Services::FindUser)
      @find_user = find_user
    end

    def call(params)
      if params.invalid?
        halt 400
      elsif @user = @find_user.call(params)
        # do nothing
      else
        halt 404
      end
    end
  end
end
