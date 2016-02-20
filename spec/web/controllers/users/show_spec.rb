require 'spec_helper'

describe Web::Controllers::Users::Show do
  let(:user_repository) { double 'user_repository' }
  let(:action) { described_class.new(user_repository: user_repository) }
  let(:current_user) { double('current_user') }

  context "with invalid parameters" do
    let(:params) { Hash[] }

    it "fails with HTTP 404" do
      expect(user_repository).to receive(:find).and_return(nil)

      response = action.call(params)
      expect(response[0]).to eq 404
    end
  end

  context "with valid parameters" do
    let(:params) { Hash[ id: 42 ] }

    context "that match an existing user entity" do
      let(:user) { double 'user', id: 42 }

      it "is successful" do
        allow(action).to receive(:current_user).and_return(current_user)
        expect(user_repository).to receive(:find).and_return(user)

        response = action.call(params)
        expect(response[0]).to eq 200
      end
    end

    context "that don't match and exisitng user entity" do
      it "fails with HTTP 404" do
        expect(user_repository).to receive(:find).and_return(nil)

        response = action.call(params)
        expect(response[0]).to eq 404
      end
    end
  end
end
