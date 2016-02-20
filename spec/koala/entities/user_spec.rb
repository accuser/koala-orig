require 'spec_helper'

describe User do
  let(:params) {
    Hash[
      email: 'alice@example.com',
      password: 'password',
      first_name: 'Olive',
      last_name: 'Brockwell'
    ]
  }

  let(:user) { described_class.new(params) }

  it "has an email address attribute" do
    expect(user).to respond_to(:email)
  end

  it "can be initialized with an email parameter" do
    expect(user.email).to eq 'alice@example.com'
  end

  it "has a password attribute" do
    expect(user).to respond_to(:password)
  end

  it "can be initialized with a password parameter" do
    expect(user.password).to eq 'password'
  end

  it "has a first_name attribute" do
    expect(user).to respond_to(:first_name)
  end

  it "can be initialized with a first_name parameter" do
    expect(user.first_name).to eq 'Olive'
  end

  it "has a last_name attribute" do
    expect(user).to respond_to(:last_name)
  end

  it "can be initialized with a last_name parameter" do
    expect(user.last_name).to eq 'Brockwell'
  end
end
