module Web
  module Controllers
    module Session
      # Endpoint for DELETE /session
      class Destroy
        include Web::Action

        def call(_)
          self.current_user = nil
        end
      end
    end
  end
end
