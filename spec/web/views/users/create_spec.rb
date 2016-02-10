require 'spec_helper'

describe Web::Views::Users::Create do
  let(:exposures) { Hash[] }
  let(:template) { Hanami::View::Template.new('apps/web/templates/users/create.html.haml') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }
end
