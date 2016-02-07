require 'spec_helper'

describe Web::Controllers::Users::Show do
  let(:find_user) { double 'service' }
  let(:action) { described_class.new(find_user: find_user) }
  let(:current_user) { double('current_user') }

  context "with invalid parameters" do
    let(:params) { Hash[] }

    it "fails with HTTP 400" do
      response = action.call(params)
      expect(response[0]).to eq 400
    end
  end

  context "with valid parameters" do
    let(:params) { Hash[ id: 42 ] }
    
    context "that match an existing user entity" do
      let(:user) { double 'user', id: 42 }
  
      it "is successful" do
        allow(action).to receive(:current_user).and_return(current_user)
        expect(find_user).to receive(:call).and_return(user)

        response = action.call(params)
        expect(response[0]).to eq 200
      end
    end

    context "that don't match and exisitng user entity" do
      it "fails with HTTP 404" do
        expect(find_user).to receive(:call).and_return(nil)

        response = action.call(params)
        expect(response[0]).to eq 404
      end
    end
  end
end
