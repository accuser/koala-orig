require 'spec_helper'

describe Koala::Services::ChangePassword do
  let(:user) { double 'user', id: 42, password: 'password' }
  let(:params) { Hash[ password: 'password', new_password: 'secret' ] }
  let(:repository) { double 'repository' }
  let(:service) { described_class.new(user, repository: repository) }

  it "updates the password" do
    expect(repository).to receive(:update).with(42, password: 'secret').and_return(user)

    response = service.call(params)
  end

  it "returns the user entity" do
    expect(repository).to receive(:update).with(42, password: 'secret').and_return(user)

    response = service.call(params)
    expect(response).to eq user
  end
end
