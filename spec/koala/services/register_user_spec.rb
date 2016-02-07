require 'spec_helper'

describe Koala::Services::RegisterUser do
  let(:params) { Hash[ email: 'alice@example.com', password: 'password' ] }
  let(:user) { double 'user' }
  let(:repository) { double 'repository' }
  let(:service) { described_class.new(repository: repository) }

  it "creates a new user entity" do
    expect(User).to receive(:new).with(params).and_return(user)
    expect(repository).to receive(:create).with(user).and_return(user)

    result = service.call(params)

    expect(result).to eq user
  end
end
