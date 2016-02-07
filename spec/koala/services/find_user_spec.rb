require 'spec_helper'

describe Koala::Services::FindUser do
  let(:params) { Hash[ id: 42 ] }
  let(:user) { double 'user' }
  let(:repository) { double 'repository' }
  let(:service) { described_class.new(repository: repository) }

  it "finds an exisiting user entity" do
    expect(repository).to receive(:find).with(42).and_return(user)

    result = service.call(params)

    expect(result).to eq user
  end
end
