require 'spec_helper'

describe Koala::Services::FindUser do
  let(:params) { Hash[ id: 42 ] }
  let(:user) { double 'user' }
  let(:repository) { double 'repository' }
  let(:service) { described_class.new(repository: repository) }

  context "with a matching id" do
    it "returns the user entity" do
      expect(repository).to receive(:find).with(42).and_return(user)

      response = service.call(params)
      
      expect(response).to eq user
    end
  end

  context "without a matching id" do
    it "returns nil" do
      expect(repository).to receive(:find).with(42).and_return(nil)

      response = service.call(params)
      
      expect(response).to be_nil
    end
  end
end
