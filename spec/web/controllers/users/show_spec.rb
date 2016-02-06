require 'spec_helper'

describe Web::Controllers::Users::Show do
  let(:repository) { double 'repository' }
  let(:action) { described_class.new(repository: repository) }
  let(:current_user) { double('current_user') }

  context "with valid parameters" do
    let(:user) { double 'user', id: 42 }

    it "is successful" do
      allow(action).to receive(:current_user).and_return(current_user)
      expect(repository).to receive(:find).and_return(user)

      response = action.call(id: 42)
      expect(response[0]).to eq 200
    end
  end
end
