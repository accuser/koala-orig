require 'spec_helper'

describe Koala::Interactors::PasswordChanger do
  let(:user) { double 'user', id: 42, password: 'password' }
  let(:user_repository) { double 'repository' }
  let(:interactor) { described_class.new(user, params, user_repository: user_repository) }

  context "with valid parameters" do
    let(:params) { Hash[ password: 'password', new_password: 'secret' ] }

    it "updates the password" do
      expect(user_repository).to receive(:update).with(42, password: 'secret')

      interactor.call
    end

    it "is successful" do
      allow(user_repository).to receive(:update)

      result = interactor.call
      expect(result).to be_success
    end

    it "exposes the user" do
      allow(user_repository).to receive(:update)

      result = interactor.call

      expect(result.user).to eq user
    end
  end

  context "with invalid parameters" do
    let(:params) { Hash[ password: 'wrong_password' ]}

    it "is unsuccessful" do
      result = interactor.call

      expect(result).to_not be_success
    end
  end
end
