require 'spec_helper'

describe Web::Controllers::Pages::About do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
