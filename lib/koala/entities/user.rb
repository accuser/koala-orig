# A user
class User
  include Hanami::Entity

  attributes :email, :password, :auth_token, :first_name, :last_name
end
