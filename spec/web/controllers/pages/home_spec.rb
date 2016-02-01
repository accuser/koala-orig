require 'spec_helper'
require_relative '../../../../apps/web/controllers/pages/home'

describe Web::Controllers::Pages::Home do
  let(:action) { Web::Controllers::Pages::Home.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
