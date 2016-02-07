require 'spec_helper'

describe Web::Controllers::Session::Create do
  let(:sign_in) { double 'service' }
  let(:action) { described_class.new(sign_in: sign_in) }

  context "with invalid parameters" do
    let(:params) { Hash[ user: {} ] }

    it "fails with HTTP 400" do
      response = action.call(params)
      expect(response[0]).to eq 400
    end
  end

  context "with valid parameters" do
    let(:params) { Hash[ user: { email: 'alice@example.com', password: 'password' } ] }
  
    context "that match an existing user entity" do
      let(:user) { double 'user', id: 42, token: 'T0K3N' }
  
      it "authenticates the current user" do
        expect(sign_in).to receive(:call).and_return(user)

        response = action.call(params)
        expect(response[0]).to eq 302
      end

      it "redirects the client to the new user path" do
        expect(sign_in).to receive(:call).and_return(user)

        response = action.call(params)
        expect(response[1]['Location']).to eq '/users/42'
      end
    end

    context "that don't match an existing user entity" do
      it "fails with HTTP 422" do
        expect(sign_in).to receive(:call).and_return(nil)

        response = action.call(params)
        expect(response[0]).to eq 422
      end
    end
  end
end
