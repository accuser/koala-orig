# A session
class Session
  include Hanami::Entity

  attributes :user_id, :token, :created_at, :updated_at
end
