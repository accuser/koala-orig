require 'spec_helper'

describe Web::Views::Users::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template) { Hanami::View::Template.new('apps/web/templates/users/new.html.erb') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }
end
