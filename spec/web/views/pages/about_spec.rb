require 'spec_helper'

describe Web::Views::Pages::About do
  let(:exposures) { Hash[] }
  let(:template) { Hanami::View::Template.new('apps/web/templates/pages/about.html.erb') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }
end
