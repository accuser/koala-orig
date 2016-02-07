module Web::Controllers::Session
  class New
    include Web::Action
    
    def call(params)
      self.current_user = nil
    end
  end
end
