module Web::Views::Users
  class Show
    include Web::View

    def user
      @user_presenter ||= Web::Presenters::UserPresenter.new(@locals[:user])
    end
  end
end
