require 'spec_helper'

describe Koala::Interactors::TokenAuthenticator do
  let(:user) { double 'user' }
  let(:user_repository) { double 'user_repository' }
  let(:interactor) { described_class.new(params, user_repository: user_repository) }

  context "with valid parameters" do
    let(:params) { Hash[ token: 'cb0G9HtuQrICPI39RXJoig' ] }

    it "returns the user entity with the matching token" do
      allow(user_repository).to receive(:user_with_token).and_return(user)

      result = interactor.call

      expect(result).to be_success
      expect(result.user).to eq user
    end

    it "fails if the token doesn't match" do
      allow(user_repository).to receive(:user_with_token).and_return(nil)

      result = interactor.call

      expect(result).to_not be_success
      expect(result.user).to be_nil
    end
  end

  context "with invalid parameters" do
    let(:params) { Hash[] }

    it "fails" do
      result =interactor.call
      expect(result).to_not be_success
    end
  end
end
