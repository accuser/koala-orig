module Web::Controllers::Users
  class Show
    include Web::Action

    params do
      param :id, presence: true
    end

    expose :user

    private
    attr_reader :find_user

    def initialize(find_user: Koala::Services::FindUser)
      @find_user = find_user
    end

    public
    def call(params)
      if params.invalid?
        self.status = 400
      elsif @user = find_user.call(params)
        # do nothing
      else
        self.status = 404
      end
    end
  end
end
