require 'spec_helper'

describe Koala::Services::AuthenticateUser do
  let(:params) { Hash[ email: 'alice@example.com', password: 'password' ] }
  let(:user) { double 'user' }
  let(:repository) { double 'repository' }
  let(:service) { described_class.new(repository: repository) }

  it "returns the user entity with the matching email and password" do
    expect(repository).to receive(:user_with_email).with('alice@example.com').and_return(user)
    expect(user).to receive(:password).and_return('password')

    result = service.call(params)
    expect(result).to eq user
  end

  it "returns nil if the email matches, but the password is incorrect" do
    expect(repository).to receive(:user_with_email).with('alice@example.com').and_return(user)
    expect(user).to receive(:password).and_return('secret')

    result = service.call(params)
    expect(result).to be_nil
  end

  it "returns nil if the email doesn't match" do
    expect(repository).to receive(:user_with_email).with('alice@example.com').and_return(nil)

    result = service.call(params)
    expect(result).to be_nil
  end
end
