require 'spec_helper'

describe Koala::Interactors::UserCreator do
  let(:user) { double 'user' }
  let(:user_repository) { double 'user_repository' }
  let(:interactor) { described_class.new(params, user_repository: user_repository) }

  context "with valid parameters" do
    let(:params) { Hash[ email: 'alice@example.com', password: 'password' ] }

    it "creates a new user entity" do
      expect(User).to receive(:new).with(params).and_return(user)
      expect(user_repository).to receive(:create).with(user).and_return(user)

      result = interactor.call

      expect(result).to be_success
      expect(result.user).to eq user
    end
  end

  context "with invalid parameters" do
    let(:params) { Hash[] }

    it "fails" do
      result = interactor.call

      expect(result).to_not be_success
    end
  end
end
