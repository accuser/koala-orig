require 'spec_helper'

describe Web::Controllers::Session::Create do
  let(:email_authenticator) { double 'email_authenticator' }
  let(:action) { described_class.new(email_authenticator: email_authenticator) }

  context "with invalid parameters" do
    let(:params) { Hash[ user: {} ] }

    it "fails with HTTP 422" do
      allow(email_authenticator).to receive(:new).and_return(email_authenticator)
      allow(email_authenticator).to receive(:call).and_return(email_authenticator)
      allow(email_authenticator).to receive(:success?).and_return(false)

      response = action.call(params)
      expect(response[0]).to eq 422
    end
  end

  context "with valid parameters" do
    let(:params) { Hash[ user: { email: 'alice@example.com', password: 'password' } ] }

    context "that match an existing user entity" do
      let(:user) { double 'user', id: 42, auth_token: 'T0K3N' }

      it "authenticates the current user" do
        expect(email_authenticator).to receive(:new).and_return(email_authenticator)
        expect(email_authenticator).to receive(:call).and_return(email_authenticator)
        expect(email_authenticator).to receive(:success?).and_return(true)
        expect(email_authenticator).to receive(:user).and_return(user)

        response = action.call(params)

        expect(response[0]).to eq 302
      end

      it "redirects the client to the new user path" do
        allow(email_authenticator).to receive(:new).and_return(email_authenticator)
        allow(email_authenticator).to receive(:call).and_return(email_authenticator)
        allow(email_authenticator).to receive(:success?).and_return(true)
        allow(email_authenticator).to receive(:user).and_return(user)

        response = action.call(params)
        expect(response[1]['Location']).to eq '/users/42'
      end
    end

    context "that don't match an existing user entity" do
      it "fails with HTTP 422" do
        allow(email_authenticator).to receive(:new).and_return(email_authenticator)
        allow(email_authenticator).to receive(:call).and_return(email_authenticator)
        expect(email_authenticator).to receive(:success?).and_return(false)

        response = action.call(params)
        expect(response[0]).to eq 422
      end
    end
  end
end
