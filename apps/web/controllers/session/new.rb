module Web
  module Controllers
    module Session
      # Endpoint for GET /session/new
      class New
        include Web::Action

        def call(_)
          self.current_user = nil
        end
      end
    end
  end
end
