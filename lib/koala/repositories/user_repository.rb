# The user repository
class UserRepository
  include Hanami::Repository

  def self.user_with_email(email)
    query do
      where(email: email)
    end.limit(1).first unless email.blank?
  end

  def self.user_with_token(token)
    query do
      where(token: token)
    end.limit(1).first unless token.blank?
  end
end
