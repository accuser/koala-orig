require 'spec_helper'

describe Web::Controllers::Password::Update do
  let(:user) { double 'user', id: 42, password: 'password' }
  let(:password_updater) { double 'password_updater' }
  let(:action) { described_class.new(password_updater: password_updater) }
  let(:params) { Hash[ password: { password: 'password', new_password: 'sectet' } ] }

  it 'is successful' do
    allow(action).to receive(:current_user).and_return(user)
    allow(password_updater).to receive(:new).and_return(password_updater)
    allow(password_updater).to receive(:call).and_return(password_updater)
    allow(password_updater).to receive(:success?).and_return(true)

    response = action.call(params)

    expect(response[0]).to eq 302
  end
end
