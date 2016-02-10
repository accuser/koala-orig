require 'spec_helper'

describe Web::Controllers::Session::Destroy do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it "sets the current_user to nil" do
    expect(action).to receive(:current_user=).with(nil).and_return(nil)
    response = action.call(params)
  end
end
