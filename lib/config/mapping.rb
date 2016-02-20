collection :users do
  entity     User
  repository UserRepository

  attribute :id, Integer
  attribute :email, String
  attribute :password, Koala::Password
  attribute :first_name, String
  attribute :last_name, String
end
