require 'spec_helper'

class ActionWithAuthentication
  include Hanami::Action::Exposable
  include Hanami::Action::Session
  include Koala::Authentication

  def call(params)
    if current_user.nil?
      # do nothing
    else
      self.current_user = nil
    end
  end
end

describe ActionWithAuthentication do
  let(:action) { described_class.new }
  let(:session) { Hash[ auth: 'T0K3N' ]}

  it "gets the authentication token from the session" do
    expect(action).to receive(:session).and_return(session)
    action.call({})
  end

  it "exposes #current_user" do
    allow(action).to receive(:session).and_return(session)

    action.call(Hash[])
    expect(action.exposures).to include :current_user
  end
end
