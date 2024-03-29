require 'spec_helper'

describe Web::Views::Pages::Home do
  let(:exposures) { Hash[] }
  let(:template) { Hanami::View::Template.new('apps/web/templates/pages/home.html.haml') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }
end
