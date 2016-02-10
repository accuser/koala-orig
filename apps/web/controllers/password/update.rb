module Web
  module Controllers
    module Password
      class Update
        include Web::Action

        params do
          param :user do
            param :password, presence: true
            param :new_password, presence: true, confirmation: true
          end
        end

        private
        attr_reader :change_password

        def initialize(register_user: Koala::Services::ChangePassword)
          @change_password = change_password
        end

        public
        def call(params)
          if params.invalid?
            # do nothing
          elsif self.current_user = change_password.new.call(params)
            redirect_to routes.user_path(current_user.id)
          else
            # do nothing
          end
        end
      end
    end
  end
end
