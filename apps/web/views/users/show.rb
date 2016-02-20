module Web
  module Views
    module Users
      # View helper for the users/show template
      class Show
        include Web::View

        # The exposed user
        #
        # @returns [UserPresenter] a presenter for the exposed user
        def user
          @user_presenter ||= Web::Presenters::UserPresenter.new(@locals[:user])
        end
      end
    end
  end
end
