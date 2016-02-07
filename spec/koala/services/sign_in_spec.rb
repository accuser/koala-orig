require 'spec_helper'

describe Koala::Services::SignIn do
  let(:params) { Hash[ email: 'alice@example.com', password: 'password' ] }
  let(:user) { double 'user' }
  let(:repository) { double 'repository' }
  let(:service) { described_class.new(repository: repository) }

  it "finds an exisiting user entity" do
    expect(repository).to receive(:user_with_email).with('alice@example.com').and_return(user)
    expect(user).to receive(:password).and_return('password')

    result = service.call(params)

    expect(result).to eq user
  end
end
