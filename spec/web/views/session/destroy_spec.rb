require 'spec_helper'

describe Web::Views::Session::Destroy do
  let(:exposures) { Hash[] }
  let(:template) { Hanami::View::Template.new('apps/web/templates/session/destroy.html.erb') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }
end
