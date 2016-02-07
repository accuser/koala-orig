require 'spec_helper'

describe Web::Controllers::Users::Create do
  let(:register_user) { double 'service' }
  let(:action) { described_class.new(register_user: register_user) }

  context "with valid parameters" do
    let(:params) { Hash[ user: { email: 'alice@example.com', password: 'password' } ] }
    let(:user) { double 'user', id: 42 }

    it "creates the user entity" do
      expect(register_user).to receive(:call).and_return(user)

      response = action.call(params)
      expect(response[0]).to eq 302
    end

    it "redirects the client to the new user path" do
      expect(register_user).to receive(:call).and_return(user)

      response = action.call(params)
      expect(response[1]['Location']).to eq '/users/42'
    end

    context "when the user already exists" do
      it "doesn't create the entity" do
      expect(register_user).to receive(:call).and_return(nil)

        response = action.call(params)
        expect(response[0]).to eq 422
      end
    end
  end

  context "with invalid parameters" do
    let(:params) { Hash[] }

    it "doesn't create the entity" do
      response = action.call(params)
      expect(response[0]).to eq 400
    end
  end 
end
