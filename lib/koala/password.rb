class Password < Hanami::Model::Coercer
  def self.load(value)
    BCrypt::Password.new(value)
  end

  def self.dump(value)
    BCrypt::Password.create(value)
  end
end
