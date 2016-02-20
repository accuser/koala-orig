require 'spec_helper'

describe Koala::Interactors::EmailAuthenticator do
  let(:user) { double 'user' }
  let(:user_repository) { double 'user_repository' }
  let(:interactor) { described_class.new(params, user_repository: user_repository) }

  context "with valid parameters" do
    let(:params) { Hash[ email: 'alice@example.com', password: 'password' ] }

    it "returns the user entity with the matching email and password" do
      allow(user_repository).to receive(:user_with_email).and_return(user)
      allow(user).to receive(:password).and_return('password')

      result = interactor.call

      expect(result).to be_success
      expect(result.user).to eq user
    end

    it "fails if the email matches, but the password doesn't" do
      allow(user_repository).to receive(:user_with_email).with('alice@example.com').and_return(user)
      allow(user).to receive(:password).and_return('secret')

      result = interactor.call

      expect(result).to_not be_success
      expect(result.user).to be_nil
    end

    it "fails if the email doesn't match" do
      allow(user_repository).to receive(:user_with_email).and_return(nil)

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
