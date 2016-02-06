class UserRepository
  include Hanami::Repository

  def self.user_with_email(email)
    query do
      where(email: email)
    end.limit(1).first
  end

  def self.user_with_token(token)
    query do
      where(token: token)
    end.limit(1).first
  end
end
