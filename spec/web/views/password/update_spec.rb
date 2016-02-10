require 'spec_helper'

describe Web::Views::Password::Update do
  let(:user) { double 'user', id: 42 }
  let(:exposures) { Hash[ current_user: user ] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/password/update.html.haml') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #current_user' do
    expect(view.current_user).to eq user
  end
end
