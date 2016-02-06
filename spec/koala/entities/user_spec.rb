require 'spec_helper'

describe User do
  let(:params) { Hash[ email: 'alice@example.com', password: 'password' ] }
  let(:user) { described_class.new(params) }

  it "has an email address attribute" do
    expect(user).to respond_to(:email)
  end

  it "can be initialized with an email parameter" do
    expect(user.email).to eq 'alice@example.com'
  end

  it "has a password attribute" do
    expect(user).to respond_to(:password)
  end

  it "can be initialized with a password parameter" do
    expect(user.password).to eq 'password'
  end
end
