require 'spec_helper'

describe Web::Controllers::Session::Create do
  let(:repository) { double 'repository' }
  let(:action) { described_class.new(repository: repository) }

  context "with valid parameters" do
    let(:params) { Hash[ session: { email: 'alice@example.com', password: 'password' } ] }
    let(:user) { double 'user', id: 42, token: 'T0K3N' }

    it "authenticates the current user" do
      expect(repository).to receive(:user_with_email).and_return(user)

      response = action.call(params)
      expect(response[0]).to eq 302
    end

    it "redirects the client to the new user path" do
      expect(repository).to receive(:user_with_email).and_return(user)

      response = action.call(params)
      expect(response[1]['Location']).to eq '/users/42'
    end
  end
end
